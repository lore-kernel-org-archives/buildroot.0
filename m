From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 4 Jul 2017 09:01:51 +0200
Subject: [Buildroot] [RFC PATCH v5 07/11] support/scripts: add
 reloacte-sdk.sh script for SDK relocation
In-Reply-To: <778420e1-443a-355e-e2ac-edc3f91aa2d3@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-8-git-send-email-wg@grandegger.com>
 <778420e1-443a-355e-e2ac-edc3f91aa2d3@mind.be>
Message-ID: <5d1f1a6e-084f-7530-0bdd-c2239b8bc47c@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Am 04.07.2017 um 00:01 schrieb Arnout Vandecappelle:
>   Type in the subject: reloacte -> relocate
> 
> On 30-06-17 10:37, Wolfgang Grandegger wrote:
>> It will install the script "relocate-sdk.sh" in the HOST_DIR
>> allowing to adjust the path to the SDK directory in all text
>> files after it has been moved to a new location.
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
>>   support/misc/relocate-sdk.sh | 47 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100755 support/misc/relocate-sdk.sh
>>
>> diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
>> new file mode 100755
>> index 0000000..1b0be33
>> --- /dev/null
>> +++ b/support/misc/relocate-sdk.sh
>> @@ -0,0 +1,47 @@
>> +#!/bin/bash
> 
>   Minor nit: you're not using any bashism in this script so you could just as
> well use /bin/sh as shebang.
> 
>> +#
>> +if [ "$#" -ne 0 ]; then
>> +    echo "Run this script to relocate the buildroot SDK at that location"
>> +    exit 1
>> +fi
>> +
>> +LOCFILE="./usr/share/buildroot/sdk-location"
> 
>   Minor nit: the ./ in front is redundant.
> 
>> +FILEPATH="$(readlink -f "$0")"
>> +NEWPATH="$(dirname "${FILEPATH}")"
>> +
>> +cd "${NEWPATH}"
>> +if [ ! -r "${LOCFILE}" ]; then
>> +    echo "Previous location of the buildroot SDK not found!"
>> +    exit 1
>> +fi
>> +OLDPATH="$(cat "${LOCFILE}")"
>> +
>> +if [ "${NEWPATH}" = "${OLDPATH}" ]; then
>> +    echo "This buildroot SDK has already been relocated!"
>> +    exit 0
>> +fi
>> +
>> +# Check if the path substitution does work properly, e.g.
>> +# a tree "/a/b/c" copied into "/a/b/c/" would not be allowed.
>                                    ^^^^^^^ You mean /a/b/c/a/b/c ?
>> +newpath="$(sed -e "s\\${OLDPATH}\\${NEWPATH}\\g" "${LOCFILE}")"
> 
>   \\ is a bit a weird sed separator... We use % mostly, sometimes @ or ,. But I'd
> advise %.

"%" and "@" are legal character of a file name. That's why I have chosen 
"\".

Wolfgang
