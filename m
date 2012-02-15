From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 15 Feb 2012 21:36:47 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD: change $1=DIRECTORY_URL,
 $2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <CAM+bi4s6tQ0RpfqgjGtqpT0ym=WMPvROgyVsxdzKsx0GeKwtHg@mail.gmail.com>
References: <CAM+bi4s6tQ0RpfqgjGtqpT0ym=WMPvROgyVsxdzKsx0GeKwtHg@mail.gmail.com>
Message-ID: <CAM+bi4u6SEnp+VSVbbr_-=nmavgrPGxSkBpZwpxYvoqmMr_LoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Somehow I lost part of the explanation on the commit message.

The difference is that now $1 stores the full URL of the file, whereas $2
stores the name of the file as we want it to be named after download
complets.

For example, a full copy-paste from Xilinx git:
URL='
http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;f=microblazeel-unknown-linux-gnu.tgz;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805;hb=HEAD
'
FILE='microblazeel-unknown-linux-gnu.tgz'

$(call DOWNLOAD,$(URL),$(FILE))

In case we know for sure the downloaded file is going to have the name we
want, we can omit the second parameter:

URL=ftp://ftp.idsoftware.com/idstuff/doom/doom-$(DOOM_WAD_VERSION).wad.gz
$(call DOWNLOAD,$(URL))


2012/2/15 Alvaro Gamez <alvaro.gamez@hazent.com>

> This patch modifies the definition of DOWNLOAD to receive two arguments.
>
> I think this is the generic solution to the problem, even though it is a
> change to the API.
>
> However, by making the second parameter optional, it could be possible to
> reduce
> code. To keep the more generic way, the .mk files that needed to be changed
> to the new API are kept with both arguments to the call of the function.
>
> Same thing with the, to my knowledge, unused SOURCE_CHECK_WGET and SCP
> functions.
>
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
>
> 2012/2/14 Arnout Vandecappelle <arnout@mind.be>
>
>> **
>>
>> On Tuesday 14 February 2012 18:54:22 Spenser Gilliland wrote:
>>
>> > After greping through the source the enormity of that patch and the
>>
>> > potential for out of tree breakage suggest a different course of
>>
>> > action.  A possible solution may be to scan the SITE var for a
>>
>> > question mark and only change to non-slash mode on that occasion.
>>
>> > Would this be reasonable?
>>
>>
>>  Yeah, my patch was too easy :-)
>>
>>
>>  I think it's better to keep the split at the /
>>
>>
>>  We could use either
>>
>> microblaze_v2.0.git;a=blob;f=microblaze-unknown-linux-gnu.tgz
>>
>> or
>>
>> ?p=xldk/microblaze_v2.0.git;a=blob;f=microblaze-unknown-linux-gnu.tgz
>>
>> as the _SOURCE. Of course, that still requires some serious massaging
>>
>> to avoid funky filenames that break everything. So probably not an
>>
>> option either.
>>
>>
>>  I think on the short term it is probably best to use a work-around
>>
>> like for the blackfin toolchain: a non-standard download target, that
>>
>> doesn't use the DOWNLOAD function but a custom $(WGET) call.
>>
>>
>>  On the longer term we could try to refactor that into the generic
>>
>> DOWNLOAD function.
>>
>>
>>  Regards,
>>
>> Arnout
>>
>>
>> --
>>
>> Arnout Vandecappelle arnout at mind be
>>
>> Senior Embedded Software Architect +32-16-286540
>>
>> Essensium/Mind http://www.mind.be
>>
>> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
>>
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>>
>> GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>>
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
>
> --
> ?lvaro G?mez Machado
>
>


-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/3ea3e3f2/attachment.html>
