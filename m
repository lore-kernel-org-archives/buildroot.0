From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 10:23:24 +0100
Subject: [Buildroot] [RFC 2/2] linux: Add support for specifying a
 custom directory
In-Reply-To: <b3918167-5b3d-fb4d-19a8-8775228135c0@gmail.com>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
 <1509242782-14524-3-git-send-email-f.fainelli@gmail.com>
 <20171029072649.GA2899@scaer> <20171029101249.19a91e32@windsurf>
 <6ad5572c-a3a8-2164-9086-ebd3691541a5@gmail.com>
 <20171029181251.GI2899@scaer>
 <d7e6d392-b7d1-7bdc-5048-d88fc6f0ab79@gmail.com>
 <20171030223246.GC3150@scaer>
 <b3918167-5b3d-fb4d-19a8-8775228135c0@gmail.com>
Message-ID: <20171103102324.64c1fedb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 22:03:32 -0700, Florian Fainelli wrote:

> OK. So by the same token, I should not expect that rsync operation
> syncing my development tree to output/build/linux-custom to work past
> the initial build/configuration? Right now it does not, I can make as
> many changes as I want in the directory reference from local.mk and
> output/build/linux-custom remains the same as it was the first time it
> got rsync'd, is that really expected?
> 
> I really wonder how you guys are doing serious kernel development with
> buildroot?

Come on Florian, such a silly and uninformed statement coming from you?
I could expect that from a less seasoned open-source contributor, but
from you, I'm really surprised.

This is explained very clearly in the section "8.12.6. Using Buildroot
during development" of the manual,
https://buildroot.org/downloads/manual/manual.html, which states:

"""

  When Buildroot finds that for a given package, an
  <pkg>_OVERRIDE_SRCDIR has been defined, it will no longer attempt to
  download, extract and patch the package. Instead, it will directly
  use the source code available in in the specified directory and make
  clean will not touch this directory. This allows to point Buildroot
  to your own directories, that can be managed by Git, Subversion, or
  any other version control system. To achieve this, Buildroot will use
  rsync to copy the source code of the component from the specified
  <pkg>_OVERRIDE_SRCDIR to output/build/<package>-custom/.

  This mechanism is best used in conjunction with the make <pkg>-rebuild
  and make <pkg>-reconfigure targets. A make <pkg>-rebuild all sequence
  will rsync the source code from <pkg>_OVERRIDE_SRCDIR to
  output/build/<package>-custom (thanks to rsync, only the modified
  files are copied), and restart the build process of just this package.

"""

This is also explained in details in the Buildroot training materials,
http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
slide 269 and following.

So, before making such statements, could you perhaps read the
documentation first?

Also, it's worth mentioning that when I do active kernel development, I
personally don't build my kernel within Buildroot, but separately. I
use Buildroot to build the root filesystem (often a simple initramfs),
but I build the kernel separately. The kernel build process is simple
enough that building it separately is often easier.

<pkg>_OVERRIDE_SRCDIR can however be useful if you're building kernel
modules, as it ensures they are installed in the root filesystem.

However, I believe <pkg>_OVERRIDE_SRCDIR is particularly useful when
you're actively developing/debugging a user-space application/library
that has a complicated build process. In this case, having Buildroot
trigger the build is easier.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
