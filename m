From: Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com>
Date: Fri, 22 Jun 2012 16:28:28 +0200
Subject: [Buildroot] Can I use the toolchain build with buildroot,
 as an external toolchain ?
In-Reply-To: <4F6B677E.4020706@gmail.com>
References: <1531E53627F1F749B4FE809BF2A4EB6703136FE8@WETMEX10.loepfe.com>
 <jkfl6r$bev$1@dough.gmane.org> <20120322175530.1f14a73a@skate>
 <4F6B677E.4020706@gmail.com>
Message-ID: <js1vea$ns$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/2012 18:55, Steve Calfee wrote:
> On 03/22/2012 09:55 AM, Thomas Petazzoni wrote:
>> Hello,
>>
>>
>> Yes, I agree.
>>
>> If you want to do that anyway, here are the steps. From a pristine
>> Buildroot configuration:
>>
>> * Select your architecture
>> * Select your architecture variant
>> * In Build options, set the host dir to /opt/your-toolchain-name where
>> your-toolchain-name would typically be arm-linux-uclibcgnueabi or
>> something like that (but it can also be anything else)
>> * In Toolchain, use the Buildroot internal backend, and configure
>> everything (gcc version, binutils version, etc.)
>> * In Packages, disable Busybox (i.e no packages at all should be
>> selected)
>> * In target filesystems, disable the tarball (i.e no filesystems at
>> all should be selected)
>>
>> Then, build with make. You have your toolchain
>> in /opt/your-toolchain-name. You can erase your Buildroot build and
>> configuration now.
>>
>> Now, you can do a second Buildroot to build your system itself,
>> re-using the toolchain you have created.
>>
>> In the toolchain menu, select external toolchain, and then Custom
>> external toolchain. In the toolchain path,
>> set /opt/your-toolchain-name/usr/, and adjust the
>> IPv6/RPC/locale/wide-char options to the ones you have used when
>> building your toolchain. Don't worry if you're not sure here: Buildroot
>> will check at the beginning of the build all those options and will
>> abort if anything is incorrect.
>>
>> Regards,
>>
>> Thomas Petazzoni
>
> I do it slightly differently. I go through most of your steps above,
> except I leave the toolchain in the default buildroot directory. (I
> think it is in output/host...). Then I check out another buildroot tree
> and select external toolchain in that tree to point to the other
> buildroot tree with just the compiler.
>
> This way if I forgot a needed toolchain option, I can go back to the
> original tools tree, make clean, configure to what I need and rebuild
> just the toolchain. Also I can easily upgrade to the latest buildroot
> tools when needed.
>
> You should always use an external toolchain, otherwise the development
> tree is just too painful to do a "make clean" in. But in my use case the
> external toolchain is an external buildroot toolchain.
>
> Regards, Steve

Hi all,

I'm also trying to speed-up my build by saving already built toolchain 
to different place and use it as external toolchain in second build. 
Most of the build goes well but I get stuck at webkit build where it 
complains that sysroot libraries are not on the place they are 
originally built. I would say this is question for webkit package but I 
noticed that at beginning Buildroot will make symbolic links from my 
ext-toolchain to its output/host/usr/bin directory with following command:

Checking external toolchain settings
Copy external toolchain libraries to target...
Copy external toolchain sysroot to staging...
mkdir -p 
/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin; 
cd 
/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/bin; 
\
	for i in 
/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/../host/usr/bin/i686-linux-*; 
do \
		case "$i" in \
		*cc|*cc-*|*++|*++-*|*cpp) \
			base=${i##*/}; \
			ln -sf ext-toolchain-wrapper $base; \
			;; \
		*) \
			ln -sf $i .; \
			;; \
		esac; \
	done ;

I was wondering can this be solved without making symbolic links but 
with providing original ext-toolchain path during package configure 
procedure? Also not sure if this is true cause for webkit issue but it's 
worth trying this if not complicated.

For reference here is log that I get before build stops:
   CXXLD  Programs/jsc
   CCLD   Programs/minidom
   CXXLD  libwebkit-1.0.la
libtool: link: warning: library
`/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/libstdc++.la'
was moved.
libtool: link: warning: library
`/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/libstdc++.la'
was moved.
libtool: link: warning: library
`/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/libstdc++.la'
was moved.
libtool: link: warning: library
`/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/libstdc++.la'
was moved.
libtool: link: warning: library
`/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/libstdc++.la'
was moved.
libtool: link: warning: library
`/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/host/usr/i686-unknown-linux-gnu/sysroot/lib/libstdc++.la'
was moved.
Too many arguments
make[2]: *** [libwebkit-1.0.la] Error 1
make[2]: Leaving directory
`/var/lib/hudson/jobs/DevBuildroot_2011-05_x86/workspace/buildroot-2011.05/output/build/webkit-1.2.7'

Regards,
Aleksandar
