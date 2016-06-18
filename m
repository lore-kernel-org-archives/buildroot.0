From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 16:14:15 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <20160615220634.67eb8fa9@free-electrons.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
Message-ID: <85363762-ca68-9ed3-f962-34f20352b9e3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Alexey, Vlad, All,

Le 15/06/2016 ? 22:06, Thomas Petazzoni a ?crit :
> Hello,
> 
> The previous patchwork cleanup period being over, it's time to start
> the second period, with 10 other patches. We're on June 15th, so I'll
> give people until June 30th to react on the following patches. If
> there's no reaction, like no interest from either the original
> submitter nor any other Buildroot developer, the patch will be marked
> Rejected on June 30th.
> 
> If you are in To: of this e-mail, then one or several of the patches
> below have been authored by you, so you should be interested :-)
> 
> Thanks,
> 
> Thomas
> 
>  5. Fix for the makeinfo / missing issue, proposal from Romain
>     http://patchwork.ozlabs.org/patch/595041/
>     http://patchwork.ozlabs.org/patch/595042/
>     http://patchwork.ozlabs.org/patch/595043/
> 
>     We need to take a decision on this one. The problem also occurs for
>     gdb and binutils on ARC, for which we've added a custom hack
>     recently.
> 
>     I tried to play with timestamps by touch'ing the .info files before
>     the build, it worked with one of gdb or binutils, but failed for
>     the other.
> 
>     So either we take Romain's approach, or we bite the bullet and add
>     a host-makeinfo package on which we depend when gdb/binutils are
>     fetched from Git.
> 

IHMO the real problem is that binutils/gdb doesn't support --disable-docs
option. When present on the command line, this option must completely disable
the documentation (man, info, pdf etc) and let the build continue.

It seems that this issue was already discussed back in 2007 [1].
Last year I submitted a patch upstream to do that but it was not complete and
not tested due to autoconf version mismatch [2].

If we want to autoreconf binutils/gdb in Buildroot we must downgrade autoconf to
2.64 and automake to 1.12.6.

Alexey, Vlad, I would suggest to rework your patch [3] and add --disable-docs
option instead of testing missing 127 return value.
If you succeed, we can reject my proposal from patchwork :)

Best regards,
Romain

[1] https://sourceware.org/ml/gdb-patches/2007-11/msg00102.html
[2] https://sourceware.org/ml/gdb-patches/2015-09/msg00073.html
[3] http://lists.busybox.net/pipermail/buildroot/2016-June/163037.html
