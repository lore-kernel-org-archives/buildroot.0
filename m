From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 12:10:22 +0200
Subject: [Buildroot] [PATCH] quagga: Do not use fork on noMMU platforms
In-Reply-To: <C89D20716E201D428CB114157FC1F4E380F18DF0@BLR-SJP-MBX-1.wipro.com>
References: <1405684663-3100-1-git-send-email-yuvaraj.patil@wipro.com>
 <20140718140358.2ff1bf5b@free-electrons.com>
 <C89D20716E201D428CB114157FC1F4E380F18DF0@BLR-SJP-MBX-1.wipro.com>
Message-ID: <20140720121022.65c59a81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Jul 2014 17:12:19 +0000, yuvaraj.patil at wipro.com wrote:

> > Patches must have a description + Signed-off-by line.
> 
> I could see, Signed-off line is added in patch.

You're being confused because you're doing a patch that adds a patch,
and we do require a Signed-off-by line on both.

We need a Signed-off-by in the commit log of the git commit that
describes the Buildroot change, but we also require a Signed-off-by
*inside* the patch you're adding, i.e inside the file that was named
package/quagga/quagga.patch in your commit. We also require a
description to be added in this file.

> I used below command sequence (blue colour) to generate a patch.
> 
> #Diff to make a code patch
> 
> diff -Nurp <package_orig> <package> > <patch_name>.patch
> 
> 
> 
> #Move the diff generated patch to buildroot package directory

And here, you should edit this file, add a description and a
Signed-off-by line.

> git add <patch name>.patch
> 
>                 git commit -a -s
> 
>                 #add the comment
> 
> 
> 
> git format-patch -1
> 
>                 #edit the patch to add comments

Not necessarily needed. You can add whatever comments are needed while
doing "git commit -a -s", as long as you format the commit log as
follows:

======================================================================
<topic>: <description>

Blabla blabla description of the change.

Some more description of the change

Signed-off-by: Some One <some.one@gmail.com>
---
And here some comments you want to send, but not have them included in
the commit log.
======================================================================

Notice how "---" separates what git will include forever in its commit
history (what's before the "---" sign) and what is only used to convey
additional comments to the patch that should not be added to the commit
permanently (what's after the "---" sign).

> >We have already received numerous patches like this from ADI, and
> >each time our answer was the same: please include in the patch
> >description a justification of why the fork() call can be replaced
> >by vfork(). I'm sure >you know that vfork() is not equivalent to
> >fork() and that we cannot simply replace one by the other without
> >checking carefully how
> 
> >fork() is used. With vfork(), the parent process is blocked until
> >the child exits or calls exec(), and all changes made by the child
> >will be visible by the parent. There are therefore many situations
> >in which
> 
> >vfork() cannot be used as a replacement for fork().
> 
> Can you please provide us a reference example (or a sample patch)
> from other architectures, how the fork() issue is fixed?

Usually, we simply make the package not available on non-MMU
architectures. So far, I don't think anybody submitted a patch turning
fork() into vfork() with sufficient explanations for us to include the
change.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
