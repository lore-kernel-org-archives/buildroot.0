From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 22 Mar 2012 10:55:10 -0700
Subject: [Buildroot] Can I use the toolchain build with buildroot,
 as an external toolchain ?
In-Reply-To: <20120322175530.1f14a73a@skate>
References: <1531E53627F1F749B4FE809BF2A4EB6703136FE8@WETMEX10.loepfe.com>
 <jkfl6r$bev$1@dough.gmane.org> <20120322175530.1f14a73a@skate>
Message-ID: <4F6B677E.4020706@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/22/2012 09:55 AM, Thomas Petazzoni wrote:
> Hello,
>
>
> Yes, I agree.
>
> If you want to do that anyway, here are the steps. From a pristine
> Buildroot configuration:
>
>   * Select your architecture
>   * Select your architecture variant
>   * In Build options, set the host dir to /opt/your-toolchain-name where
>     your-toolchain-name would typically be arm-linux-uclibcgnueabi or
>     something like that (but it can also be anything else)
>   * In Toolchain, use the Buildroot internal backend, and configure
>     everything (gcc version, binutils version, etc.)
>   * In Packages, disable Busybox (i.e no packages at all should be
>     selected)
>   * In target filesystems, disable the tarball (i.e no filesystems at
>     all should be selected)
>
> Then, build with make. You have your toolchain
> in /opt/your-toolchain-name. You can erase your Buildroot build and
> configuration now.
>
> Now, you can do a second Buildroot to build your system itself,
> re-using the toolchain you have created.
>
> In the toolchain menu, select external toolchain, and then Custom
> external toolchain. In the toolchain path,
> set /opt/your-toolchain-name/usr/, and adjust the
> IPv6/RPC/locale/wide-char options to the ones you have used when
> building your toolchain. Don't worry if you're not sure here: Buildroot
> will check at the beginning of the build all those options and will
> abort if anything is incorrect.
>
> Regards,
>
> Thomas Petazzoni

I do it slightly differently. I go through most of your steps above, 
except I leave the toolchain in the default buildroot directory. (I 
think it is in output/host...). Then I check out another buildroot tree 
and select external toolchain in that tree to point to the other 
buildroot tree with just the compiler.

This way if I forgot a needed toolchain option, I can go back to the 
original tools tree, make clean, configure to what I need and rebuild 
just the toolchain. Also I can easily upgrade to the latest buildroot 
tools when needed.

You should always use an external toolchain, otherwise the development 
tree is just too painful to do a "make clean" in. But in my use case the 
external toolchain is an external buildroot toolchain.

Regards, Steve
