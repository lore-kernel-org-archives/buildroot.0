From: Alex Baldwin <alexbaldwinmusic@gmail.com>
Date: Sun, 11 Feb 2018 17:25:25 +0100
Subject: [Buildroot] [PATCH v2 1/1] LIBLO : bump version to 0.29
In-Reply-To: <20180210184552.14500165@windsurf.lan>
References: <1518118669-24714-1-git-send-email-alexbaldwinmusic@gmail.com>
 <20180208230400.06741487@windsurf.lan>
 <CA+bRTvCnigi1UKbkhQv2zGy0vCshgDfzGuOnvv_PjVMXq-_Qgw@mail.gmail.com>
 <20180210184552.14500165@windsurf.lan>
Message-ID: <CA+bRTvDn01oj1dD0NSDaOif8DPSFWLyCjFCGZu8Z=+W_zc_dtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas (sorry about the double message, forgot to include the mailing list!)

On 10 February 2018 at 18:45, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello Alex,
>
> On Sat, 10 Feb 2018 17:19:16 +0100, Alex Baldwin wrote:
>
>> I  am not sure the best place to address this so please correct me :) I
>> noticed that this patch failed with your submission as well as Matt
>> Webber's, but for different reasons.
>>
>> It seems that on yours
>> http://autobuild.buildroot.net/results/71a6d7e02a50f6cb53c70c38e82e2a2ae8af13ea/build-end.log
>> there is a warning about having to redirect <sys/poll.h> to <poll.h> in the
>> file "server.c:54". This could be sorted with a simple patch, is it
>> acceptable to patch for this?
>
> Yes, it is acceptable. In addition to fixing this particular problem,
> it would be nice to avoid using -Werror. Indeed, the problem here is
> that this warning is treated as an error, causing a build failure.
>
> While -Werror makes sense during development, it doesn't make much
> sense for releases.
>
>> On Matt's
>> http://autobuild.buildroot.net/results/c8b/c8bed3a3fa7d2b2258f573cbfcb01af07419e0bf/build-end.log
>> we fail because undefined reference to  __atomic_fetch_add_4 . I think a
>> possible fix could be manually linking to libatomic. I am not entirely sure
>> why, seems that some compilers are happy to find libatomic on their own and
>> others aren't. Is this something that buildroot would normally patch for?
>
> The libatomic situation depends on the architecture. On most
> architectures, __atomic_fetch_add_4 is a compiler builtin, so you don't
> need to link with libatomic.
>
> However, on SPARC (which is the CPU architecture on which this build
> failure occurs), libatomic is needed for __atomic_fetch_add_4.
>
> You have two solutions to handle that:
>
>  (1) Just pass LIBS="-latomic" in LIBLO_CONF_ENV when
>      BR2_TOOLCHAIN_HAS_LIBATOMIC=y
>
>  (2) Patch the configure.ac script so that it tests if linking with
>      libatomic is needed or not, and links with it if needed.


>
> In any case, if you do a patch against liblo, don't forget to submit it
> upstream.

When submitting this patch should I include it as V3 (as V2 failed),
with all the original patches and ammend the changlog or simply just
submit the new changes?


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com

Thanks,

Alex
