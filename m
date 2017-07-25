From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 09:32:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libressl: needs MMU
In-Reply-To: <20170724210702.GM12791@waldemar-brodkorb.de>
References: <20170723200844.13004-1-bernd.kuhls@t-online.de>
 <20170724180723.4786fad5@windsurf.lan>
 <20170724210702.GM12791@waldemar-brodkorb.de>
Message-ID: <20170725093230.17956ffc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 23:07:03 +0200, Waldemar Brodkorb wrote:

> > On this one, I'd like to have the feedback from Waldemar. Indeed,
> > libressl is not using fork(), but __register_atfork(), which uClibc
> > does not implement, and I've not found why it doesn't exist for noMMU
> > platforms.  
> 
> From the comment in the header:
> "Register handlers to execute before and after `fork'"
> 
> As this is a feature only available when fork() is there, this isn't
> available for noMMU platforms.

Well, there could have been a dummy __register_atfork(), which does
nothing on noMMU. Indeed, you can imagine a library registering a
callback using __register_atfork(), but not using itself the fork()
system call. Such a library would be OK for a noMMU platform.

> It was added in this commit:
> https://github.com/libressl-portable/portable/commit/32d9eeeecf4e951e1566d5f4a42b36ea37b60f35
> 
> But I think the commit log isn't correct, as pthread_atfork can be
> used for glibc, musl and uClibc-ng. (for glibc -lpthread must be
> added)
> 
> One possible solution might be, to check for __register_atfork, if
> it does not exist, fallback to pthread_atfork, if it does not exist
> provide a pthread_atfork dummy (noMMU case).

This should be doable without too much effort I believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
