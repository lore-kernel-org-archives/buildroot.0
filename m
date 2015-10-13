From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Oct 2015 09:03:33 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <20151012232441.3322b2fa@free-electrons.com>
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
 <20151010150457.GD3640@free.fr> <20151012224411.472a9d10@free-electrons.com>
 <20151012211618.GG3735@free.fr> <20151012232441.3322b2fa@free-electrons.com>
Message-ID: <561CACC5.5020600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-10-15 23:24, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Mon, 12 Oct 2015 23:16:18 +0200, Yann E. MORIN wrote:
> 
>>> > > I agree on the principle, but I think we should rather handle that like
>>> > > we do for other options: enable automatically the needed option.
>> > 
>> > Except for PCI it does not really makes sense, see Arnout's explanations:
>> >     http://lists.busybox.net/pipermail/buildroot/2015-October/141178.html
> Except that I disagree with Arnout :)
> 
> Arnout is not making the difference between being able to *build* and
> being able to *run*.
> 
> CONFIG_PCI is needed for the build to proceed, so it is normal that we
> enable it automatically. The PCI root complex drivers are only needed
> for the PCI support to actually work on the target, not for iqvlinux to
> build.
> 
> And the story is the same for xtable-addons: the additions in linux.mk
> were made because those kernel options were needed for xtable-addons to
> simply *build*.


 And of course I disagree with Thomas :-)

 I think we should follow the principle of least surprise. We should avoid
situations where a package builds and we know for sure it will not work at
runtime. In many cases, this cannot be avoided, but if we can avoid it, we should.

 With xtables it's slightly different since if we enable those kernel config
options, it will actually work at runtime (at least as far as we can tell).
Similar for the systemd options - which BTW are really runtime-only, systemd
doesn't check for them at all at build time.

 Fortunately, what you've committed amounts to a build-time check: the iqvlinux
build will error out if CONFIG_PCI isn't enabled. The error message will be
cryptic and will not tell the user how to fix it, but at least it is less
cryptic than when the user enables the package and it simply doesn't do anything
without any error message at all.

 So basically, the check added by Romain is just making the build error message
less cryptic, so it is really optional.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
