From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Nov 2018 21:14:11 -0600
Subject: [Buildroot] [PATCH v2 2/6] package/llvm: install target
 binary/debug tools
In-Reply-To: <ae5caeb6-f258-4d00-bbb4-12726fa5d4f3@gmail.com>
References: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1542426982-54683-2-git-send-email-matthew.weber@rockwellcollins.com>
 <50862e38-68c7-e166-a719-82ab28f7aad9@smile.fr>
 <CANQCQpbU9jTkv9L8B80o+k2x_sAtDVOhhE9KFjUXA_nVuV=ang@mail.gmail.com>
 <CANLo3Ji5+U+2OkL8pMD=8B-iQL29AZLDGXWdcijjzgzSqc3hzQ@mail.gmail.com>
 <CANQCQpbdA1O5sRxpxax3ZQepzsA7WPhinB=oW8dVYYweQrbTOQ@mail.gmail.com>
 <6b1c1219-de01-1012-09a8-eb33181cc2bc@gmail.com>
 <CANQCQpbmLGK955=w74NOM5A67k_rJtUF3domF_+==zpTaHVOvw@mail.gmail.com>
 <ae5caeb6-f258-4d00-bbb4-12726fa5d4f3@gmail.com>
Message-ID: <CANQCQpZQdVcA3f+Deh8-Hb_1AhYjKntzAHHfONFz5ngCVxKJWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Wed, Nov 21, 2018 at 3:19 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi Matt,
>
> Le 21/11/2018 ? 04:12, Matthew Weber a ?crit :
> > On Tue, Nov 20, 2018 at 4:37 PM Romain Naour <romain.naour@gmail.com> wrote:
> >>
> >> Hi Matt,
> >>
> >> Le 19/11/2018 ? 14:04, Matthew Weber a ?crit :
> >>> Romain,
> >>>
> >>> On Mon, Nov 19, 2018 at 2:10 AM Romain Naour <romain.naour@gmail.com> wrote:
> >>>>
> >>>> Hi Matt,
> >>>>
> >>>> Le lun. 19 nov. 2018 ? 02:48, Matthew Weber <matthew.weber@rockwellcollins.com> a ?crit :
> >>>>>
> >>>>> Romain,
> >>>>>
> >>>>> On Sun, Nov 18, 2018 at 1:14 PM Romain Naour <romain.naour@smile.fr> wrote:
> >>>>>>
> >>>>>> Hi Matt,
> >>>>>>
> >>>>>> Le 17/11/2018 ? 04:56, Matt Weber a ?crit :
> >>>>>>> The compiler-rt fuzzer and address sanitizer tools require additional
> >>>>>>> LLVM binary tools installed to allow stack trace decoding actively during
> >>>>>>> executable analysis.
> >>>>>>>
> >>>>>>> https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack
> >>>>>>>
> >>>>>>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> >>>>>>> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> >>>>>>
> >>>>>> For some reason I get an error while building llvm package tools.
> >>>>>>
> >>>>>> x86_64-linux-g++: WARNING: unsafe header/library path used in cross-compilation:
> >>>>>> '-I/usr/include/libxml2'
> >>>>>>
> >>>>>> Can you have a look?
> >>>>>
> >>>>> I went back and checked my logs on the clang compiler-rt run-test
> >>>>> build for that warning and didn't find it.  I then checked and my
> >>>>> config and it has the unsafe header/library as error.  Was your build
> >>>>> test just applying my patches and doing an explicit 'make llvm'?
> >>>>
> >>>>
> >>>> Indeed,
> >>>> Some tools use libxml2, so you have to add target libxml2 package as build dependency.
> >>>>
> >>>
> >>> Would you mind sharing your verbose output and equivalent of cmake
> >>> config guess/status?
> >>>
> >>
> >> I need to rebuild from scratch since I've fixed the build locally.
> >> I'll restart a new one next week-end.
> >>
> >
> > Something like the following added to package/llvm/llvm.mk?  (Still
> > haven't see this on my end.  I messed with my host system a bit to get
> > libxml2 support and headers in place, no luck.)
> >
> > # LLVM requires libxml2
> > HOST_LLVM_CONF_OPTS += \
> >        -DLIBXML2_LIBRARIES=$(HOST_DIR)/lib \
> >        -DLIBXML2_INCLUDE_DIR=$(HOST_DIR)/include/libxml2
> > HOST_LLVM_DEPENDENCIES += host-libxml2
> > LLVM_CONF_OPTS += \
> >        -DLIBXML2_LIBRARIES=$(STAGING_DIR)/usr/lib \
> >        -DLIBXML2_INCLUDE_DIR=$(STAGING_DIR)/usr/include/libxml2
> > LLVM_DEPENDENCIES += libxml2
>
> I reproduced the issue: https://pastebin.com/s8PZvuGt
>

Ah ok, I see you have the AMD GPU stuff enabled.  I'll enable that and
see if I can reproduce the path poisoning.  Then do some builds
with/without explicitly disabling via -DLLVM_ENABLE_LIBXML2.

Matt
