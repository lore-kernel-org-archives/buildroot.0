From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Dec 2012 08:03:10 +0100
Subject: [Buildroot] [PATCH] pkg-download.mk: Fix shallow clone
In-Reply-To: <CANxTyt74ytgBNHb8koKuVTjei5sQP2FpUrwawMuG17=fAK3bXw@mail.gmail.com>
References: <1354445767-15308-1-git-send-email-sho@relinux.de>
 <8738zo7835.fsf@dell.be.48ers.dk>
 <CANxTyt74ytgBNHb8koKuVTjei5sQP2FpUrwawMuG17=fAK3bXw@mail.gmail.com>
Message-ID: <50C0432E.2080005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/12 03:14, Danomi Manchego wrote:
> So I'm wondering why the recent changes in this area used grep at all, rather than asking ls-remote directly.  I.e.:
>
> ((test `git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION) | cut -f 2-` && \
>
> If there is feedback that the above is desirable, then I can send in the patch.

  The argument of test should be quoted to avoid getting the same problem again
when the ref matches more than once for some reason.

  Or even better: use the exit code:

git ls-remote --exit-code $($(PKG)_SITE) $($(PKG)_DL_VERSION) > /dev/null 2>&1 && \

(hopefully the --exit-code option exists in older gits as well...)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
