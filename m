From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Nov 2016 00:41:22 +0100
Subject: [Buildroot] [PATCH v2 3/3] pru-sample: add sample PRU
	application
In-Reply-To: <CAK8F28mp6tU3oncTK5FpNqUU9o-z0fUOMOxoGYEw7yeRd9uJ5A@mail.gmail.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
 <1a270629-34f9-06f6-fb58-25455e61900d@mind.be>
 <CAK8F28mHwYonzL1Wx052TXCzd3U4TjvfQiMPuqxuQmRBLv-2zg@mail.gmail.com>
 <20161127144731.18bd30cb@free-electrons.com>
 <CAK8F28mp6tU3oncTK5FpNqUU9o-z0fUOMOxoGYEw7yeRd9uJ5A@mail.gmail.com>
Message-ID: <698688f1-7d97-fe08-0a47-ebd6e2c68761@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-11-16 12:34, Ash Charles wrote:
> 
> On Sun, Nov 27, 2016 at 8:47 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com
> <mailto:thomas.petazzoni@free-electrons.com>> wrote:
>>
>> Why is pru-software-support a host package? It really builds/installs
>> things for the target, even if the target is the PRU and not the ARM.
>>
>> Was it made a host tool after a discussion with Arnout?

> It is really best described as a staging package for the PRU. There are only
> headers and a library used for static linking. IIRC, Arnout suggested that
> putting this as staging was confusing---these aren't for the target e.g.
> ARM---and suggested instead that we treat them as host tools along with the rest
> of the tool chain.

 Yeah, but now I'm not so sure anymore.

 Clearly, TI_CGT_PRU_INSTALLDIR is the equivalent of STAGING_DIR for the PRU. In
that sense, it makes sense to have TI_CGT_PRU_INSTALLDIR as a subdirectory of
HOST_DIR (just like STAGING_DIR is a subdirectory of HOST_DIR). And it anyway
has to be a subdirectory of HOST_DIR because the compiler executables are
installed there as well. For me, that was the reason to say that it should be a
host package.

 However, we are indeed building for the target (kind of). and we are installing
into a staging directory (though it is not in STAGING_DIR). So it makes sense to
make it a target package, with INSTALL_STAGING = YES, but where the
INSTALL_STAGING step doesn't actually install in staging but in the 'PRU
staging' i.e. TI_CGT_PRU_INSTALLDIR.

 Thomas, do you agree?


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
