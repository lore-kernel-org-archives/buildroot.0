From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Oct 2014 13:28:30 +0200
Subject: [Buildroot] [PATCH 1/1] openocd bump to 0.8.0
In-Reply-To: <543655B0.8030304@integrazionetotale.it>
References: <1412801633-3394-1-git-send-email-claudio.laurita@integrazionetotale.it>
 <20141008231040.57406af4@free-electrons.com>
 <5435C245.1090100@integrazionetotale.it>
 <20141009095735.529fd5ca@free-electrons.com>
 <543655B0.8030304@integrazionetotale.it>
Message-ID: <20141009132830.77fc2c47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Claudio Laurita,

On Thu, 09 Oct 2014 11:30:24 +0200, Claudio Laurita wrote:

> Thank you very much. BR is doing much for me in my everyday work.
> I'm trying to do something for BR. I'll do my best.

And that's much appreciated, thanks!

> >   * For the target version, provide many configuration options to only
> >     build what's really needed, as we need to save space on the target
> >     and build only the features that will be useful.
> >
> >   * For the host version, just build all the possible features (i.e
> >     support for all the JTAG interfaces, etc.). I don't think OpenOCD is
> >     that long to build, so it should be a reasonable compromise I
> >     believe.
> Very wise suggestion. I finally caught the basic philosophy and I like it.

Ok, great.

> I agree. OpenOCD build system is a bit "particular". But, giving the 
> right options (from their point of view) we get the right result (from 
> our point of view too).
> So I'd not define it "buggy", just "different". A buggy thing needs 
> patching, a different one needs flexibility. Maybe this could be the 
> right case to use the overriding features of BR. A custom build system, 
> a custom configure command. It sounds logic to me. Isn't it? Anyway, it 
> would be nice to have a way to modify the standard BR configure command, 
> instead of replacing it totally. This is what I was looking for with my 
> first terrific tentative. A single line solving everything (but 
> destroying all the rest, a modest side effect for the sake of elegance).
> As this is a sort of exercise/challenge for me, I wasn't looking for the 
> easiest way, but the cleanest one, or the most elegant, if you prefer. 
> But I don't want to abuse of your time, just to learn something.

No, it's buggy: the OpenOCD build system is based on the autotools, and
the autotools normally guarantee that you can do:

	--enable-foo --disable-foo

and be sure that "foo" will be disabled. The fact that OpenOCD doesn't
comply with that makes it incorrect.

The reason why we don't allow to change the base options is because you
never need to do so: you can override them as I just exposed above.

And the build system of OpenOCD is really buggy: if you specify
--enable-shared --enable-static, it builds a shared variant of jimtcl,
but OpenOCD tries to link against the static variant. This is not
coherent at all.

Another option you could look at is to use the existing Buildroot
jimtcl package, instead of relying on the jimtcl implementation built
into OpenOCD. I've seen that OpenOCD has an option to use an external
jimtcl implementation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
