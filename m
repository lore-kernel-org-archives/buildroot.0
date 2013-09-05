From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 5 Sep 2013 09:03:33 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: detect missing patches
In-Reply-To: <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
References: <20130813160017.GA2590@harvey.netwinder.org>
 <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
Message-ID: <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 23, 2013 at 12:31 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Ralph,
>
> On Tue, Aug 13, 2013 at 6:00 PM, Ralph Siemsen <ralphs@netwinder.org> wrote:
>> apply-patches.sh: detect missing patches
>>
>> The current patch logic does not detect missing patch files,
>> particularly when using a series file. If the series file
>> refers to non-existent patches, a minor warning appears,
>> but the build continues.
>>
>> The root cause is the "cat <patchfile> | patch ..." pipleline.
>> When patchfile does not exist, the "cat" command prints a
>> warning, however, the pipeline status is determined by the
>> final "patch" command. And since patch has not received any
>> input, it returns success.
>>
>> There are two possible solutions that I can see:
>>   1. set -o pipefail, then pipeline will return error from 'cat'
>>   2. check for patch existence explicitly
>> I've opted for 2nd choice, it seems less risky.
>>
>> The following patch adds the check. It also fixes the indentation
>> of an adjacent line (TAB versus spaces) making it consistent.
>>
>> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
>> index 7d5856c..a3f7153 100755
>> --- a/support/scripts/apply-patches.sh
>> +++ b/support/scripts/apply-patches.sh
>> @@ -76,7 +76,11 @@ function apply_patch {
>>      esac
>>      echo ""
>>      echo "Applying $patch using ${type}: "
>> -       echo $patch >> ${builddir}/.applied_patches_list
>> +    if ! test -e "${path}/$patch" ; then
>
> Any particular reason why your using the explicit 'test' and not [ -e ... ] ?
>
>> +       echo "Error: missing patch file ${path}/$patch"
>> +       return 1
>> +    fi
>> +    echo $patch >> ${builddir}/.applied_patches_list
>>      ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}"
>>      if [ $? != 0 ] ; then
>>          echo "Patch failed!  Please fix ${patch}!"
>
> Although I agree with the concept of checking for existence, I'm not
> sure about the action to take.
> Earlier in apply-patches.sh, if a patch is in an unsupported format,
> it is simply skipped (and a message printed). I think the action in
> that case should line up with the nonexisting patch case, so either
> give a warning and continue, or an error and stop.

Any input from others?

Thanks,
Thomas
