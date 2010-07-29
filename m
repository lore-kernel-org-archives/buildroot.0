From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 29 Jul 2010 07:18:56 -0500
Subject: [Buildroot] [PATCH 1/2] gcc: remove option on SJLJ exceptions
In-Reply-To: <201007290659.39124.minimod@morethan.org>
References: <cover.1280385006.git.thomas.petazzoni@free-electrons.com>
	<20100729133837.5680e0c2@surf>
	<201007290659.39124.minimod@morethan.org>
Message-ID: <201007290718.59051.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu July 29 2010, Michael S. Zick wrote:
> On Thu July 29 2010, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Thu, 29 Jul 2010 05:38:06 -0500
> > "Michael S. Zick" <minimod@morethan.org> wrote:
> > 
> > > And of course you confirmed that the Lua package's
> > > error handling still works properly, complete with
> > > same backtrace that is produced when SJLJ exceptions are enabled.
> > 
> > No, I did not.
> > 
> > > You did make that test didn't you?
> > 
> > Why do you need to be so aggressive ? It is possible that removing this
> > option was a mistake, but there's *really* no need to be so
> > aggressive. It only reduces the motivation to look at the problem...
> >
> 
> The last time this subject came up on the ML tests seemed to indicate
> that the option was required by the Lua package.
> 
> I just presumed you have been following the mailing list postings.
>  
> > So, trying to be constructive, how can I test that Lua still produces
> > correct backtraces ? (I'm not a Lua programmer at all).
> > 
> 
> Pass an illegal value to a library routine or to a routine that you write.
> "Lua" refers to both a set of C libraries and to the interactive mode which
> uses those same libraries.
> 
> So testing with the interactive mode should be enough to see a backtrace.
> 
> Since the libraries (written in ANSI C) are quite close to the interactive
> environment (usually only one or two calls away) you will not see a very
> long backtrace unless you write a function or two of your own, but you will
> get one.
>

And if you write a function, just to show a longer backtrace:
(functions are first-class values, so they can be written as an assignment)
Try:

mszick at wolf466:~$ lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> bye = function() return os.exit("String Value") end
> bye()
stdin:1: bad argument #1 to 'exit' (number expected, got string)
stack traceback:
        [C]: in function 'exit'
        stdin:1: in function 'bye'
        stdin:1: in main chunk
        [C]: ?
>

Mike

> 
> I.E:
> mszick at wolf466:~$ lua
> Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> > os.exit("String Value")
> stdin:1: bad argument #1 to 'exit' (number expected, got string)
> stack traceback:
>         [C]: in function 'exit'
>         stdin:1: in main chunk
>         [C]: ?
> 
> The "[C]" just means that is a hunk of compiled C code, for which the 
> language does not have any more information to give you about it.
> 
> And: os.exit(0) should get you back out of the interactive Lua (or ctrl-D).
> 
> Mike
> 
> > Thanks,
> > 
> > Thomas
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
