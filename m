From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 7 Jan 2016 17:35:52 -0300
Subject: [Buildroot] ifupdown-0.8.2 / dhcp-4.1-ESV-R12 incompatibility
In-Reply-To: <CA+sos7-4puPse5UehUFe3LO7DvfTattF+qUAu4n==LAdOBwYzw@mail.gmail.com>
References: <20160106142628.GA3891@dkarchlinux64.currentcomm.com>
 <568EB85E.3090501@zacarias.com.ar>
 <CA+sos7-4puPse5UehUFe3LO7DvfTattF+qUAu4n==LAdOBwYzw@mail.gmail.com>
Message-ID: <568ECC28.50704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/16 17:30, Beno?t Th?baudeau wrote:

> I had started to look into this a few months ago, and setting
> --with-libbind=PATH to use the bind provided by Buildroot seemed to be
> a better option (in order to avoid possibly installing two instances
> of bind on the target, either standalone or inside the dhcp binaries
> if statically linked, and both bind versions were compatible at that
> time), though I have not yet tested it.

Hi Beno?t.
Let me save you some time, it doesn't work as expected.
I've tried pointing that into the bind build directory (because it needs 
some specific *.a files that i think aren't installed, besides another 
problem) but no luck, since it stills expects that to live in it's own 
build directory, try in dhcp's source dir:

find . -name Makefile.am -exec grep --with-filename ../bind/lib {} \;

...and you'll see the drastic results.

Even so with that fixed the bind package will need to get tweaked as 
well, since if you build shared-only you won't get those intermediate 
libraries built, and hence dhcp will fail as well.

All in all, it seems pretty broken.

Regards.
