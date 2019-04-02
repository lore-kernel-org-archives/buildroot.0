From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Apr 2019 20:41:43 +0200
Subject: [Buildroot] Failed to build in a user namespace without the
 root user
In-Reply-To: <CA+gSDyRCnG0HuJ4QVsFoROqCHBkn+MR7H39BQBmzHfHRm2B5gA@mail.gmail.com>
 (Esben Nielsen's message of "Sun, 31 Mar 2019 23:51:18 +0200")
References: <CA+gSDyRCnG0HuJ4QVsFoROqCHBkn+MR7H39BQBmzHfHRm2B5gA@mail.gmail.com>
Message-ID: <87ftr0gsgo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Nielsen <nielsen.esben@gmail.com> writes:

 > I try to build in an unpriviliged container (using bubblewrap), where
 > I only have a single user id, not uid 0.

Sounds special, but OK.

 > I found the issue was in fakeroot, which per default when it does
 > chown, it also asks the kernel if the id it does chown to actually
 > exists. This is the default behaviour.

Sorry, where do you see that? Looking at the fakeroot code, the only
thing FAKEROOTDONTTRYCHOWN controls is if the wrapped chown also calls
the real chown syscall:

int chown(const char *path, uid_t owner, gid_t group){
..
  if(!dont_try_chown())
    r=next_lchown(path,owner,group);
  else
    r=0;
  if(r&&(errno==EPERM))
    r=0;

  return r;

Does lchown(path, 0, 0); return anything else than EPERM in your
bubblewrap setup?


 > Shouldn't it totally ignore the uid and gid map in the user namespace
 > in the kernel?

The goal is indeed that Buildroot builds do not differ based on the
build host. We are not there yet though.


 > Shoudln't that be default in buildroot? It is totally irrelevant,
 > which is uids are mapped on the host when building a rootfs to run
 > somewhere else.

I have no problem with setting this environment variable the one place
in fs/common.mk where we invoke fakeroot as there is indeed no reason to
try to perform a chown "for real" for the Buildroot use cases, but I
would like to understand what goes wrong exactly for you?

-- 
Bye, Peter Korsgaard
