From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 14 Dec 2015 22:34:05 +0100
Subject: [Buildroot] [PATCH v2 1/4] libfslcodec: add install hooks to
 fix libraries path
In-Reply-To: <20151213203114.GB27769@free.fr>
References: <1449755560-2911-1-git-send-email-gary.bisson@boundarydevices.com>
 <1449755560-2911-2-git-send-email-gary.bisson@boundarydevices.com>
 <20151213203114.GB27769@free.fr>
Message-ID: <CAAMH-yscbiH8px5daX93ZvAzfEF57UePuLHC64DaXw_qpKxfRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Sun, Dec 13, 2015 at 9:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Gary, All,
>
> On 2015-12-10 14:52 +0100, Gary Bisson spake thusly:
>> By default, all the libraries are installed under /usr/lib/imx-mm which
>> causes problems at runtime.
>>
>> The hooks are inspired from the mechanism used in the Yocto recipe:
>> https://github.com/Freescale/meta-fsl-arm/blob/fido/recipes-
>> multimedia/libfslcodec/libfslcodec.inc
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>>
>> Here are the dependencies the pipelines above are testing:
>> $ for i in `find target/usr/lib/gstreamer*/*`; do readelf -d $i | grep NEEDED | grep lib_ && echo "($i)"; done
>>  0x00000001 (NEEDED)                     Shared library: [lib_nb_amr_dec_arm9_elinux.so.2]
>>  0x00000001 (NEEDED)                     Shared library: [lib_wb_amr_dec_arm9_elinux.so.2]
>> (target/usr/lib/gstreamer-0.10/libmfw_gst_amrdec.so)
>>  0x00000001 (NEEDED)                     Shared library: [lib_peq_arm11_elinux.so.1.fhw]
>> (target/usr/lib/gstreamer-0.10/libmfw_gst_audio_pp.so)
>>  0x00000001 (NEEDED)                     Shared library: [lib_mp3_enc_arm12_elinux.so.2]
>> (target/usr/lib/gstreamer-0.10/libmfw_gst_mp3enc.so)
>>  0x00000001 (NEEDED)                     Shared library: [lib_mp3_enc_arm12_elinux.so.2]
>> (target/usr/lib/gstreamer-1.0/libgstimxaudio.so)
>>
>> Note that I added a staging install hook as well because otherwise the
>> gst1-imx plugin doesn't find lib_mp3_enc_arm12_elinux.so at build time.
>>
>> Not to copy the same library twice I decided to go with a symlink. Let
>> me know if that's acceptable.
>
> The link you pointed to does a move, not a copy. Why do you do a symlink?
>
> 1) Where are the libraries searched for at build time? If they are
>    only searched for in /usr/lib/ , then do a move. If womething is
>    positively looking for them in /usr/lin/imx-mm/ , then do a symlink,
>    indeed.
>
> 2) Where are libraries searched for at runtime? Same logic as for build
>    time.

Just want to add something here, my v1 was doing a symlink in staging
(because of the build time dependencies) and a move at runtime since
everything is looking at the same location in that case. But then
J?r?me said that he would prefer to have the same mechanism (symlink)
in both even though it is not necessary for the target. The reason was
to have some consistency between staging and target. What are thoughts
on that?

Regards,
Gary
