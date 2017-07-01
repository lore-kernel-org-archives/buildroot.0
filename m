From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Jul 2017 15:13:18 +0200
Subject: [Buildroot] [RFC PATCH v5 03/11] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <39f7fecc-16e9-9670-4e04-5010bc902fa9@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-4-git-send-email-wg@grandegger.com>
 <e2a39afc-2f57-ce78-2a1c-9bf97fa679ae@mind.be>
 <39f7fecc-16e9-9670-4e04-5010bc902fa9@grandegger.com>
Message-ID: <CAHXCMMJL1KpuWnsyt1iF+zBPWL_8-woP8CwFLJ0E0S0JNLEgDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wolfgang,

On Sat, Jul 1, 2017 at 2:15 PM, Wolfgang Grandegger <wg@grandegger.com> wrote:
> Hello Arnout,
>
> the latest patch was a rather quick hack to demonstrate the per package and
> installation step approach...
>
>
> Am 01.07.2017 um 12:36 schrieb Arnout Vandecappelle:
>>
>>   Hi Wolfgang,
>>
>>   First of all, let me commend you on the large number of comments and the
>> general clarity of this script.
>>
>> On 30-06-17 10:37, Wolfgang Grandegger wrote:
>>>
>>> From: Samuel Martin <s.martin49@gmail.com>
>>>
>>> The script "fix-rpath" can scan a list of files provided via
>>> command line argument, identify ELF files, check their RPATH and
>>> fix it in a proper way. The RPATH fixup is done by the patchelf
>>> utility using the option "--make-rpath-relative <root-directory>".
>>>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> ---
>>>   support/scripts/fix-rpath | 100
>>> ++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 100 insertions(+)
>>>   create mode 100755 support/scripts/fix-rpath
>>>
>>> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
>>> new file mode 100755
>>> index 0000000..405108d
>>> --- /dev/null
>>> +++ b/support/scripts/fix-rpath
>>> @@ -0,0 +1,100 @@
>>> +#!/usr/bin/env bash
>>> +
>>> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
>>
>>
>>   Almost nothing is left of the original version by Samuel, so I think you
>> can
>> safely add your own name to the Copyright statement :-)
>
>
> Well, fine for me and nobody else complains.

Please do, you contribute at least as much as i did on this ;-)

[...]
>
>>
>>> +           ;;
>>> +
>>> +       target)
>>> +           rootdir="${TARGET_DIR}"
>>> +           sanitize_extra_args+=( "--no-standard-lib-dirs" )
>>
>>
>>   Since this is the only variation between the three, I think it would be
>> easier
>> to handle that from the caller. So
>>
>> ${0} ROOT_DIR FILES_LIST PATCHELF_ARGS...
>
>
> Could be done but we need to pass then almost all args, including
> "--remove-rpath", "--make-rpath-rleative"... Maybe that's not that nice in
> "pkg-generic.mk". But we could drop $tree and  use the $ROOT_DIR instead.

Indeed. IIRC, this was done to avoid carrying to many arguments on the
script invocation, and correctly support any host location (since it
can be set by the user via menuconfig).
If everything is passed from the invocation in pkg-generic.mk, it is ok TM.

>
>>
>>> +           ;;
>>> +
>>> +       *)
>>> +           usage
>>> +           exit 1
>>> +           ;;
>>> +    esac
>>> +
>>> +    while read -r file ; do
>>> +       # check if it's an ELF file
>>> +       path=${rootdir}/${file}
>>> +       if ${PATCHELF} --print-rpath "${path}" > /dev/null 2>&1; then
>>> +           # Work around file busy issue with patchelf binary
>>> +           if [ "${PATCHELF}" == "${path}" ]; then
>>> +               cp "${PATCHELF}" "${PATCHELF}.__patched__"
>>> +               ${PATCHELF} --debug --make-rpath-relative "${rootdir}"
>>> ${sanitize_extra_args[@]} "${PATCHELF}.__patched__"
>>
>>
>>   Do we want to keep the --debug?
>
>
> No, in the end. But I left it for the first tries.
>
> Wolfgang.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
