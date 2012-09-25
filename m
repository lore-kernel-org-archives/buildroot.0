From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Tue, 25 Sep 2012 00:29:24 -0700 (PDT)
Subject: [Buildroot] Kernel version
In-Reply-To: <5060CF90.7070605@mind.be>
References: <1348517486.7248.YahooMailNeo@web164604.mail.gq1.yahoo.com>
 <5060CF90.7070605@mind.be>
Message-ID: <1348558164.41699.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?
I will try to be more specific and I am aware that host kernel version doesn't matter in this story. 
I have kernel sources for my board 2.6.32 on let' say "BoardKernelDir" directy. There, I also have ".config" file, for
kernel configuration.
Then I go into Buildroot menues (make menuconfig) and under "Kernel/Kernel version"
choose 3.2.6. In that same page of Buildroot menu, I can choose "Kernel configuration (Using custom configuration file)" 
to be the one I mentioned above (".config").
Question is - is it wrong procedure and what kernel will be built this way- the one from
"BoardKernelDir" (2.6.32) or 3.2.6 or (probably) it will make some mess ?
Also, can I somehow?(in Buildroot)?use sources for my board - not?those downloaded from kernel.org.
I intend to use CrosstoolNG.
Hope this is more clear.
?
Regard

? 

________________________________
 From: Arnout Vandecappelle <arnout@mind.be>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Monday, September 24, 2012 11:24 PM
Subject: Re: [Buildroot] Kernel version
  
On 09/24/12 22:11, Zoran Djordjevic wrote:
> A problem with tslib - "selected device uses a different version of the event protocol than tslib was compiled for"
> initiated me to rethink about item in Buildroot menu under "Kernel" subtree.
> What I don't understand is the meaning of Kernel version (where I can enter for example 3.2.6) and custom kernel
> configuration file - which could be ".config" from directory where are my linux sources (for example 2.6.32).
> Questions are - how Buildroot knows where from to take kernel sources (is it directory where ".config" is ?) and
> what in that case means "Kernel version " item ? Which kernel is built - if 3.2.6 then where sources come from
> (Internet ?). Or is it only proper way to set "Kernel version" alsoto 2.6.32 according to above examples, but in that
> case where the sources come from ?

Hi Zoran,

Since I don't understand what you mean with all of the above, I'll just explain
how things work.

Buildroot downloads and compiles a linux kernel.? This kernel has nothing to
do with the kernel on your build machine - you could be building a 3.5 kernel
on a 2.4.32 build machine.? The kernel version that you specify in buildroot
is the version that will be downloaded from kernel.org.? If you have a custom
kernel source tree locally, you can use the CUSTOM_TARBALL or CUSTOM_GIT
options to build that one instead of a downloaded kernel.org tree.

To build a kernel, you need a configuration file.? This can either be one of
the configuration files that are present in the kernel source itself (in the
arch/<arch>/configs directory), or a custom configuration file that you provide.
To create such a custom configuration file, you have two approaches:
- start from a kernel-provided configuration file for your platform, and tweak
it later.? Then you start with "use a defconfig", build the kernel, play around
with it.? Later, you run 'make linux-menuconfig' to modify the configuration,
build and test it again.? Finally, you change the buildroot configuration to
use a custom configuration file and set the filename to something that doesn't
exist yet.? Then, you run 'make linux-update-defconfig' to create the custom
configuration file.
- Instead of starting from a defconfig, you can also immediately start with
a custom configuration file.? You have to make sure it exists in this case,
but you can just do 'touch <filename>' to create it.? Then run
'make linux-menuconfig' and configure it as you like.


Now, regarding the issue with tslib: that probably means that tslib was built
with kernel headers that are different from the kernel on which you are running.
Normally Linux tries to make sure that code compiled against old kernel headers
still works on newer kernels, but compiling against newer kernel headers and
running under an old kernel may be an issue.? I'm assuming you use a buildroot
toolchain (not ct-ng or an external toolchain): in that case, you can select
the kernel version to use for the kernel headers separately, under
Toolchain->Kernel Headers.? It doesn't go below 2.6.37, however.


Regards,
Arnout

-- Arnout Vandecappelle? ? ? ? ? ? ? ? ? ? ? ? ? ? ?  arnout at mind be
Senior Embedded Software Architect? ? ? ? ? ? ? ?  +32-16-286540
Essensium/Mind? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?  http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium? ? ? ? ? ? ? ? BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:? 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120925/31d5cfee/attachment-0001.html>
