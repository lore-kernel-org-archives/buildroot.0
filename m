From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 07:13:05 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <20171213182332.GB7364@scaer>
References: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
 <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
 <20171213182332.GB7364@scaer>
Message-ID: <20171214071305.33920c54@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 19:23:32 +0100, Yann E. MORIN wrote:

> > I'm still not sure what is the point of customizing the padding byte.
> > Does someone has a use-case for that ? If not, I'm not sure it makes
> > sense to add a Buildroot option for it.  
> 
> As far as I understand, this is because the U-Boot on Johannes' board
> would expect the padding byte to be 0x00 when the default for mkenvimage
> is 0xFF.

No, U-Boot does not care at all what the padding byte is. Johannes
board works just fine with the default padding byte of 0xff. All what
matters for U-Boot is that the CRC is correct.

Obviously if your environment image has a size of X bytes, its CRC is
calculated over X bytes. Then if the U-Boot configuration says the
environment has Y bytes, it calculates the CRC on Y bytes. So if X !=
Y, you're screwed, as the CRCs won't match.

Johannes problem was *not* a padding byte problem, but *only* a wrong
environment size.

> I have no idea why U-Boot expects 0x00 in Johannes' case, though. 

It does not. Johannes' U-Boot works fine with 0xff as the padding byte.

> The only thing I can think of is that the 'default' byte value on flash
> after a page-erase depends on the technology: for NOR, the value after
> erase ix 0x00, while for NAND, it is 0xFF. So maybe that's the reason...
> 
> But any case, as you said in a further reply, adding that new option
> does not add much complexity.

But it serves no purpose whatsoever :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
