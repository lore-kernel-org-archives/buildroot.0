From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 15 Feb 2014 14:29:17 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
	portability)
In-Reply-To: <20140215114418.GA5291@free.fr>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
 <CAHXCMMKE-WDNCTQ82uuEM5n=t4Ua=qTDTTaBxQ7=wVgiBejd0w@mail.gmail.com>
 <52E7543D.9010103@mind.be> <20140215114418.GA5291@free.fr>
Message-ID: <CAEYzJUHrCVAKM0mz8xiATprFQPZnBvXjJiUa59V3-gSgREeg+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 February 2014 12:44, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Arnout, All,
>
> Jumping back into this old thread, after it was referenced by Maxime in
> his XBMC series...
>
> On 2014-01-28 07:54 +0100, Arnout Vandecappelle spake thusly:
>> On 27/01/14 10:19, Samuel Martin wrote:
>> >"command -v" seems not playing very well with aliases:
>> >
>> >$ command -v make
>> >alias make='~/.config/ctafconf/bin/colorwarper make'
>> >$ which make
>> >/usr/bin/make
>>
>>  I don't think your .profile gets executed when running a shell script, so
>> the alias will not be set. Bash does use BASH_ENV to specify a startup
>> script, so perhaps we should unexport that.
>
> Here is a little test I did:
>
>     $ cat Makefile
>     all:
>         echo "'$${buz}'"
>         foo
>
>     $ cat /tmp/foo.env
>     buz="BUZ"
>     echo BAR
>     alias foo='echo FOO'
>
>     $ BASH_ENV=/tmp/foo.env ENV=/tmp/foo.env make
>     echo "'${buz}'"
>     ''
>     foo
>     make: foo: Command not found
>     make: *** [all] Error 127
>
> So, it looks like neither BASH_ENV nor ENV are parsed (ENV is for when
> bash is invoked in POSIX mode).

I just want to mention an interesting corner case in handing of
$(shell ...) in gnu make, something I just now became aware of.

The (weird) thing is that this works:

$(shell command -v sed || echo sed)    # WORKS

while this does not:

$(shell command -v sed)    # FAILS

The reason for this behaviour (from stackoverflow,
http://stackoverflow.com/questions/12989869/calling-command-v-find-from-gnu-makefile):

----
Judging from a quick look at job.c in GNU make's sources, it attempts
to avoid launching a shell when it can, i.e. when the command line is
simple enough (of the form cmd args, without redirection, compound
commands, etc.) and the shell is the default one. The issue is then
that command is a built-in and does not have an associated executable,
hence the error message from make. It does not occur when you have >
/dev/null as make considers the command as too complicated and leaves
it tosh to launch it.
----

So, is this OK for merge now?

Best regards,
Bj?rn Forsman
