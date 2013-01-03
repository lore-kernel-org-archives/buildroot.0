From: Cam Hutchison <camh@xdna.net>
Date: Thu, 03 Jan 2013 02:35:16 -0000
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
 <54c3.50e3ac2d.33c5c@xionine.xdna.net>
 <201301021931.54897.yann.morin.1998@free.fr>
Message-ID: <606d.50e4ee64.b8dde@xionine.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

>Cam, All,

>On Wednesday 02 January 2013 Cam Hutchison wrote:
>> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
>> 
>> >+* +LIBFOO_USERS+ lists the users to create for this package, if it installs
>> >+  a daemon you want to run with a specific user. The syntax is similar in
>> 
>> "if it installs a program you want to run as a specific user"
>> 
>> that is, s/daemon/program/ and s/with/as/

>Well, I would like to emphasise that this is primarily for running
>programs as daemons (ie. started by startup scripts). It does not
>really make sense to run program as a specific user when logged in,
>especially for embedded systems, where logging in a seldom done.

>What about:

>.... if it installs a daemon program you want to run as ...

I was considering a case of a periodic cron job running as a non-root
user - that is not a daemon, and is not related to logged-in users.

Since there are no actual constraints that require that the user added
be used only by a daemon, I figured the documentation should not introduce
that constraint. But documenting intentions is fine and I have no
strong feeling either way.

>> >+#----------------------------------------------------------------------------
>> >+get_uid() {
>> >+    local username="${1}"
>> >+
>> >+    grep -r -E "${username}:" "${PASSWD}" |cut -d: -f3
>> 

>> An argument could be made that you should be using grep -F.

>I don't know (ie. I don't usualy use) this switch, so I am not confident in
>using it here. If plain 'grep' does the job, lets just use that.

The problem with plain grep is that if the username contains a regular
expression metachar, then grep will not work as expected in some cases.
The most likely one is a period - a username of foo.bar will match
an existing user of fooxbar and will not allow the creation of the user
foo.bar.

More strictly, it is a matter of handling user input correctly. The user
was not expecting a username to be a regular expression, so it should not
be treated as such ...

>> You should also anchor ${username}

>Yes, indeed.

.... but a start-of-line anchor will not work with grep -F :-(

Another +1 for awk here - processing record-oriented files is what awk is
good at, but I can understand not wanting to introduce that dependency.
