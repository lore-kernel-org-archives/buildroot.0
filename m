From: David Picard <dplamp@gmx.com>
Date: Fri, 1 Feb 2019 17:08:27 +0100
Subject: [Buildroot] how to init environment for non-login shell ?
In-Reply-To: <87va23znl9.fsf@dell.be.48ers.dk>
References: <a02fffcb-b5ca-145d-f363-8e63bf3cdbfb@gmx.com>
 <87va23znl9.fsf@dell.be.48ers.dk>
Message-ID: <2c5ac4ad-4ae8-11a5-fef2-1bcb44751714@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I understand. Thanks for answering me though.

I think I fixed it. I was calling startx from a /etc/init.d/rcS script, 
so of course, there was no previous login environment to propagate. Now, 
I call startx from /etc/profile.d/startx.sh, only if X is not running.

- David

Le 01/02/2019 ? 13:42, Peter Korsgaard a ?crit?:
>>>>>> "David" == David Picard <dplamp@gmx.com> writes:
>   > Hello,
>   > I have set BR2_INIT_BUSYBOX=y.
>
>   > In login shells, no problem : /etc/profile and ~/.profile are
>   > sourced. But in non-login shells (xterm in Xorg + Fluxbox), they
>   > aren't. The $HOME variable isn't even set. How can I fix this ?
>
>   > To check what shell I'm in :
>   > $ echo $0
>   > sh??? ??? ??? ??? ??? --> non-login shell
>   > $ echo $0
>   > -sh??? ??? ??? ??? ??? --> login shell
>
> This is really a question for busybox and dash developers. From man
> dash:
>
> Invocation
>
> If no args are present and if the standard input of the shell is
> connected to a terminal (or if the -i flag is set), and the -c option is
> not present, the shell is considered an interactive shell.  An
> interactive shell generally prompts before each command and handles
> programming and command errors differently (as described below).  When
> first starting, the shell inspects argument 0, and if it begins with a
> dash ?-?, the shell is also considered a login shell.  This is normally
> done automatically by the system when the user first logs in.  A login
> shell first reads commands from the files /etc/profile and .profile if
> they exist.  If the environment variable ENV is set on entry to an
> interactive shell, or is set in the .profile of a login shell, the shell
> next reads commands from the file named in ENV.  Therefore, a user
> should place commands that are to be executed only at login time in the
> .profile file, and commands that are executed for every interactive
> shell inside the ENV file.  To set the ENV variable to some file, place
> the following line in your .profile of your home directory
>
>   ENV=$HOME/.shinit; export ENV
>
> substituting for ?.shinit? any filename you wish.
>
