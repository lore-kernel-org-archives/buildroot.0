From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Oct 2019 17:06:57 +0200
Subject: [Buildroot] [PATCH 1/9] support/scripts/genimage.sh: pass an
 empty rootpath to genimage
In-Reply-To: <CAJ4jsaeOmzbv7SE2Sh7CMPU8SKGVDNb_6JGCj=8ba99i=4E3LA@mail.gmail.com>
References: <20191013002232.1045-1-unixmania@gmail.com>
 <20191013002232.1045-2-unixmania@gmail.com>
 <05fc10ad-38f9-6761-d9f3-78635214a2a8@mind.be>
 <CAJ4jsaeOmzbv7SE2Sh7CMPU8SKGVDNb_6JGCj=8ba99i=4E3LA@mail.gmail.com>
Message-ID: <df4c9307-1d68-7c4e-8d16-fa3246fc5267@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/10/2019 14:34, Carlos Santos wrote:
> On Sun, Oct 13, 2019 at 7:11 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 13/10/2019 02:22, unixmania at gmail.com wrote:
>>> From: Carlos Santos <unixmania@gmail.com>
>>>
>>> genimage makes a full copy of the given rootpath to ${GENIMAGE_TMP}/root
>>> so passing TARGET_DIR would be a waste of time and disk space. We don't
>>> rely on genimage to build the rootfs image, just to insert a pre-built
>>> one in the disk image.
>>>
>>> Signed-off-by: Carlos Santos <unixmania@gmail.com>
>>> ---
>>>  support/scripts/genimage.sh | 10 +++++++++-
>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
>>> index 039b3fef1d..2796e19eb7 100755
>>> --- a/support/scripts/genimage.sh
>>> +++ b/support/scripts/genimage.sh
>>> @@ -30,10 +30,18 @@ done
>>>
>>>  [ -n "${GENIMAGE_CFG}" ] || die "Missing argument"
>>>
>>> +# Pass an empty rootpath. genimage makes a full copy of the given rootpath to
>>> +# ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
>>> +# space. We don't rely on genimage to build the rootfs image, just to insert a
>>> +# pre-built one in the disk image.
>>> +
>>> +trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
>>> +ROOTPATH_TMP="$(mktemp -d)"
>>
>>  Instead of a temporary directory, I think it would make sense to use a fixed
>> directory, e.g. $(BINARIES_DIR)/rootpath. This would allow the path to be used
>> for some other things, i.e. packages could install stuff in there that could be
>> used to generate a filesystem. Cfr. [1].
> 
> That's exactly what I'm attempting to avoid.
> 
>>
>>  Regards,
>>  Arnout
>>
>> [1] http://patchwork.ozlabs.org/patch/1156956/
> 
> I had to deal with that situation in the recent past. It requires a
> post-fakeroot script. You can't set ownership and permissions o the
> mount points in a post-image script.

 It only needs to be in a post-fakeroot script if you actually want to set
ownership and permissions.

 And even so, there's no reason why you couldn't run it as a post-fakeroot
script instead of a post-image script.

 That said, it remains kludgy to use genimage.sh in this way, so the patch is
definitely OK as is. I just didn't have time to do the merge yesterday.

 Regards,
 Arnout

> 
>>> +
>>>  rm -rf "${GENIMAGE_TMP}"
>>>
>>>  genimage \
>>> -     --rootpath "${TARGET_DIR}"     \
>>> +     --rootpath "${ROOTPATH_TMP}"     \
>>>       --tmppath "${GENIMAGE_TMP}"    \
>>>       --inputpath "${BINARIES_DIR}"  \
>>>       --outputpath "${BINARIES_DIR}" \
>>>
> 
