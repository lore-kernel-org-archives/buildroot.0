From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 23 Sep 2010 23:35:06 +0200
Subject: [Buildroot] [PATCH] Makefile: generate a Makefile wrapper in
	$(O)
In-Reply-To: <871v8k893i.fsf@macbook.be.48ers.dk>
References: <1285107952-24098-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<871v8k893i.fsf@macbook.be.48ers.dk>
Message-ID: <201009232335.06161.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Thursday 23 September 2010 23:04:49 Peter Korsgaard wrote:
>  Yann> If building out-of-tree, add a Makefile wrapper that calls-out
>  Yann> to the real Makefile with proper args.
>  Yann> Avoids having to pass -C and O= every time we call make.
>  Yann> This is highly inspired from how the Linux kernel does it, and
>  Yann> portions of it have been used.
> 
> Why only portions? Can't we use it all? That would make updating easier
> in the future.

Unfortunately, our 'out-of-tree' build in not similar to the one of the
kernel. In fact, we always do out-of-tree in buildroot. Let me explain...

Let's assume that $(TOPDIR) is the directory that holds the top-level
Makefile (of buildroot or the kernel).

In the Linux kernel, everything is output in $(O). The value of $(O) is
by default $(TOPDIR), and they call that "in-tree build". When the user
sets "O=blah" on the command line, then everything is put into that, and
they call that "out-of-tree build".

Now, in buildroot, we always output everything in $(O). The value of $(O)
is by default set to $(TOPDIR)/output, and we call that "in-tree build".
When the user sets "O=blah" on the command line, then everything is put
into that, and we call that "out-of-tree build".

See the slight difference in the "in-tree" case? That explains why I
couldn't use the same construct in the top-level Makefile.

Then, I have updated the mkmakefile script to remove any kernel-related
stuff. For example, we do not have a need for version and patchlevel,
and we do not have a 'quiet' build (where commands are replaced with
their beautified outputs, like CC foo/bar.o).

Next, in the Linux kernel, they always overwrite the wrapper Makefile
at each run. Doing so in buildroot caused the kconfig stuff to be always
rebuilt. So I added a check to only install the wrapper if its content
changed since last time it was isntalled.

I hope this clarifies the reasons why I said "portions of it". Those
"portions" would amount to 80-90% of this patch.

> Related to this, mkmakefile got updated in the kernel 
> back in August to support make 3.82, care to resync?

Will do, yes. Thanks for the review.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
