From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 20 May 2015 03:03:20 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-15
In-Reply-To: <CAMo8Bf+bnv4u=6bh3iots6rr0n8+i2AHHP4Y=mGbVchmWHn_eQ@mail.gmail.com>
References: <20150516063015.D2BB91018B2@stock.ovh.net>
 <CAMo8Bf+bnv4u=6bh3iots6rr0n8+i2AHHP4Y=mGbVchmWHn_eQ@mail.gmail.com>
Message-ID: <CAMo8Bf+yPQJ2Krp5s3zNQ+rFMVmZH3RFTQXPFWU7N4K-oVkBKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 16, 2015 at 5:40 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Sat, May 16, 2015 at 9:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Build statistics for 2015-05-15
>>       xtensa |                  glibmm-2.36.1 | NOK | http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/
>
> Apparently arch ABI compiler flags need to be passed to libstdc++ build.
> Looking at it.

There's a patch in the patchwork that seemed to do the right thing:
http://patchwork.ozlabs.org/patch/453849/

I've tested it and it appears that it breaks libgcc build for xtensa:
we need to filter out -mtext-section-literals from the CFLAGS, but
only for libgcc build. Other libraries bundled with gcc seem to build
well with target CFLAGS.

OTOH the issue at hand can be fixed by adding --enable-cxx-flags=$(TARGET_ABI)
to the HOST_GCC_FINAL_CONF_OPTS, but AFAIU that option only
applies to libstdc++.

Thoughts?

-- 
Thanks.
-- Max
