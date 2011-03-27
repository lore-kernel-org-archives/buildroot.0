From: Steve Calfee <stevecalfee@gmail.com>
Date: Sun, 27 Mar 2011 16:58:40 -0700
Subject: [Buildroot] Buildroot in use
In-Reply-To: <1301253551.2716.46.camel@galileo.graphics-muse.org>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>	<20110315180743.5e34890b@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>	<20110315192211.3c59f861@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>	<20110315210538.1973f87f@surf>	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
	<1301253551.2716.46.camel@galileo.graphics-muse.org>
Message-ID: <4D8FCF30.1090209@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/27/11 12:19, Michael J. Hammel wrote:
> On Wed, 2011-03-16 at 09:44 -0700, Steve Calfee wrote:
>> I think a general discussion of how we use buildroot and what we would like to
>> see is in order. It seems the framework is stabilizing and useful (thanks guys).
>
> This thread got me thinking about how and why I created BeagleBox, which
> is a metabuild that wraps other metabuilds like Buildroot and
> Crosstool-NG.  The structure is based on experience from a number of
> previous projects I did at work and heavily on what I learned trying to
> track down the bits and pieces that work for BeagleBoard.
>
> So I thought it might be of some value to write up a paper on the how's
> and why's of it all for metabuilds.  I've placed the paper online for
> critique.
>
> http://www.graphics-muse.org/wiki/pmwiki.php?n=Papers.MetabuildsForEmbeddedDevelopment
>
Interesting and well formatted document.

I do kernel driver work and find using small, but powerful platforms 
very convenient. Buildroot has evolved to the point where it is "good 
enough". I have seen (and appreciate) all the pain people have gone 
through to get the make system working and easily extended.

I personally don't like the concept of a one-button build scheme for 
actual development. Magic stuff hidden in python scripts just slows 
understanding. However it is very desirable to have a stable platform 
where known things work and I can start customizing from there.

I did a modification for the Dockstar hardware BSP someone else 
submitted and did a half-hearted submittal to the buildroot maintainers. 
I have switched to gmail so I can more easily submit using 
git-send-mail. Someday I will get back to the Dockstar and try again.

I am working on a beagleboardxm right now, and I finally have a decent 
environment for kernel hacking. I will eventually package that up and 
submit it too.

Currently, there are a few sample _defconfigs for actual hardware. They 
are understandably very bare configurations that demonstrate building a 
minimal system. This is good and I wish there were more platforms.

However, most platforms like the Dockstar and beagleboardxm have H/W 
quirks that really require customization and patches to even begin 
reliably/efficiently using them. BBXM has H/W that has really out-run 
the u-boot capabilities - it is getting very bloated supporting things 
like usb, but it needs more, for usbnet support and using mmc instead of 
nand for stuff like saveenv. Then the BBXM has what seems to be a recent 
kernel wide problem where kexec is broken. So supporting fast nfs and 
kernel updates is possible, but tricky.

I would like to ask Peter and Thomas what they think of changing the way 
board support packages are handled. I think that buildroot also needs to 
support more complete BSP packages which have common desires (booting 
for USB or booting from NFS) available as options. But this is not great 
for buildroot because it adds more downloads in a default git pull, it 
adds bit-rotting code for BSPs, and puts a bigger burden on the core 
buildroot maintainers.

What I propose is that BSPs be added just like any other package. A few 
changes to the buildroot config would allow linking in the new_defconfig 
for selected packages. The current buildroot config supports selecting 
toolchain, kernel, u-boot, busybox etc, configs, locations of patches 
for each, location of external placement of each, etc. As well as handy 
skeleton updates or additions.  It would be nice if there was a way to 
add some BSP configuration options - I think the config.in was removed 
when the bsps were moved from target/device/* to board/manu/*.

Handling BSPs as packages would enable someone like me to have a github 
git tree for a bsp, or put in the buildroot download a tar file which 
can be selected, etc just like any other package. This way when a 
developer pulls a new version of buildroot he is not also pulling in 
lots of uninteresting (and possibly quite large) BSPs. But he can select 
one that is very close to what he wants to use and get a more functional 
initial package.

Since a complete set of configurations would be part of the package, bit 
rot could be slowed. The package would select the latest version of each 
major component that it was tested and built against. In the future if 
someone wants to use an unsupported package, he may be able to build it 
with old configurations and have a stable platform to bring the BSP up 
to date.

Regards, Steve
