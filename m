From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2019 23:01:49 +0200
Subject: [Buildroot] Compiling Device Tree with Buildroot
In-Reply-To: <1570534786731.48992@ncipher.com>
References: <1570534786731.48992@ncipher.com>
Message-ID: <1495497d-ffcc-0f26-980d-b1c87ac42d48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/10/2019 13:39, Gamble, Bradley wrote:
> Howdy,
> 
> 
> I'm trying to get Buildroot to compile our custom Device Tree file as part of the build process.
> 
> I've previously been compiling it to a DTB file using "dtc" standalone and then embedding that as a node in a FIT image, however if possible I'd like to integrate this as a stage in Buildroot. I can use a post-build script to achieve this but if there is a "standard" method that would be preferred.
> 
> 
> Alternatively I was trying to build the Device Tree as part of the kernel. My Device Tree is comprised of three files under "br2-external/company/board/device-tree":

 Indeed, Buildroot (currently) only supports compiling device trees as part of
the kernel build. In practice, you often need one or more of the in-kernel dtsis.

> 
> - board.dts
> 
> - board-pre.dtsi
> 
> - board-post.dtsi
> 
> The file board.dts includes board-pre.dtsi and board-post.dtsi.
> 
> I've configured Buildroot to use an out-of-tree Device Tree however when it attempts to compile the board.dts file it is unable to find the pre and post files. Do I need to add a specific argument or flag so that the include directory is added?

 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH takes a list of .dts and .dtsi files. Only the
.dts files in the list will be compiled in a .dtb, the rest is just copied into
the kernel tree so the includes still work.

 In other words, add the .dtsi files to BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.

 Regards,
 Arnout


> 
> 
> Regards,
> 
> Bradley Gamble
> 
> ________________________________
> 
>  [cid:imageac0699.PNG at 7f5cf8a1.48a90a4d] <http://www.ncipher.com>
> Bradley Gamble
> Software Engineer
> Tel: +44 1293 580000
> 
> 
> nCipher Security
> Manor Royal
> Crawley RH10 9HA
> United Kingdom
> 
> www.ncipher.com<http://www.ncipher.com>
> 
> [cid:image17ce6e.JPG at aa840ebd.4ea6c329]<https://www.eventbrite.com/e/simon-singh-the-simpsons-and-their-mathematical-secrets-tickets-71658240727>
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
