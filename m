From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 08:01:12 +0100
Subject: [Buildroot] [PATCH 2/4] package/makedevs: use the rooted
	/etc/passwd and /etc/group
In-Reply-To: <2e6c607e821c7c6576389bb60e7fc91a35862b8b.1453411322.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 21 Jan 2016 22:23:37 +0100")
References: <cover.1453411322.git.yann.morin.1998@free.fr>
 <2e6c607e821c7c6576389bb60e7fc91a35862b8b.1453411322.git.yann.morin.1998@free.fr>
Message-ID: <8760y8gbif.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, makedevs will query the host's /etc/passwd and /etc/group to
 > resolve usernames and group names. This is inherently flawed, as we can
 > never guarantee that the UIDs will be the same on the target as on the
 > host, or even whether a particular user does exist on the host.

 > This is because getpwnam() and getgrnam() will forcibly read the
 > system's /etc/passwd and /etc/group, and there is no way to tell them to
 > look anywhere else.

 > However, we can use use fgetpwent() and fgetgrent() instead, for which
 > we can pass a FILE* stream to read from to get the entries. This means
 > we must implement the scanning-loop ourselves, but fortunately, that's
 > pretty trivial to do.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/makedevs/makedevs.c | 36 +++++++++++++++++++++++++++++-------
 >  1 file changed, 29 insertions(+), 7 deletions(-)

 > diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
 > index 53ff6fe..91f72e4 100644
 > --- a/package/makedevs/makedevs.c
 > +++ b/package/makedevs/makedevs.c
 > @@ -40,6 +40,8 @@ const char *bb_applet_name;
 >  uid_t recursive_uid;
 >  gid_t recursive_gid;
 >  unsigned int recursive_mode;
 > +#define PASSWD_PATH "etc/passwd"  /* MUST be relative */
 > +#define GROUP_PATH "etc/group"  /* MUST be relative */
 
 >  void bb_verror_msg(const char *s, va_list p)
 >  {
 > @@ -255,10 +257,20 @@ char *bb_get_chomped_line_from_file(FILE *file)
 >  long my_getpwnam(const char *name)
 >  {
 >  	struct passwd *myuser;
 > +	FILE *stream;
 
 > -	myuser  = getpwnam(name);
 > -	if (myuser==NULL)
 > -		bb_error_msg_and_die("unknown user name: %s", name);
 > +	stream = bb_xfopen(PASSWD_PATH, "r");
 > +	while(1) {
 > +		errno = 0;
 > +		myuser = fgetpwent(stream);
 > +		if (errno)
 > +			bb_error_msg_and_die(strerror(errno));
 > +		if (myuser==NULL)
 > +			bb_error_msg_and_die("unknown user name: %s", name);

On my system atleast, fgetpwent() returns NULL AND sets error to ENOENT,
so if you pass an unknown user/group name (E.G. you mistyped it),
makedevs dies with:

makedevs: No such file or directory

Which is less than helpful. I've fixed it by swapping the errno and
myuser check around. While I was at it, I also changed the
strerror(errno) -> bb_perror_msg_and_die("fgetpwent"); so the user has
some context if fgetpwent ever fails for some other reason (corrupt
passwd file?).

(Most of) the rest of the file uses spaces around == so I've added that.

Committed series with that fixed, thanks.

-- 
Bye, Peter Korsgaard
