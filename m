From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 17:21:57 +0100
Subject: [Buildroot] auto-detecting toolchain metadata?
In-Reply-To: <c42f58d1-687f-803b-08df-a039037003c9@mentor.com>
References: <c1d1dc6d-c815-1ea2-3de9-13a1da0adaec@mentor.com>
 <20161101184626.GB30593@free.fr>
 <6e24245a-9c73-ea34-e899-f19f16346d0e@mentor.com>
 <20161122092919.502273aa@free-electrons.com>
 <ca906326-1a51-56db-7411-dcf5408c9255@mentor.com>
 <20161122164917.3ee6e506@free-electrons.com>
 <c42f58d1-687f-803b-08df-a039037003c9@mentor.com>
Message-ID: <20161122172157.4814ab48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 08:12:34 -0800, Hollis Blanchard wrote:

> OK, how can I use defconfig fragments? I can't find mention of it in the 
> manual or the top-level Makefile.

Easy:

 cat frag1 frag2 frag3 > defconfig

And that's it. There's nothing fancy in fragments, it's just a fragment
of defconfig, and you create the real defconfig by concatenating
fragments.

> I do see a little information about using config fragments for 
> Kconfig-based packages, and that says it breaks savedefconfig. So if I 
> can use fragments for the BR defconfig, how could I update the defconfig 
> in the future?

Fragments are hand-written, by extracting data from a defconfig.
Typically, with the above example, you generate your defconfig from
frag1, frag2 and frag3. You then run "make menuconfig", which updates
your configuration, and run "make savedefconfig", which generates a new
defconfig.

It is impossible for Buildroot to know in which fragment should a given
change be propagated. So what I typically do is "diff -u defconfig.old
defconfig", and then propagate the change to the appropriate fragment.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
