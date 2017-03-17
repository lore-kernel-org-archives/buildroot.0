From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Mar 2017 23:09:34 +0100
Subject: [Buildroot] [RFC PATCH 5/9] support/scripts: add
 create-relocation-script for toolchain relocation
In-Reply-To: <f7838a0d-9975-7670-edf1-f6384020d2a7@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-6-git-send-email-wg@grandegger.com>
 <d7bcc124-0706-8cdf-2398-2a1d3fa4b3a4@mind.be>
 <dc66e761-80aa-22ff-0d22-4ace059f82fe@grandegger.com>
 <b16c19af-1fb5-702f-01f8-ca9eb6ff13fb@mind.be>
 <f7838a0d-9975-7670-edf1-f6384020d2a7@grandegger.com>
Message-ID: <1fb4f256-392d-e9ad-ff64-1bebfbe5acd2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-03-17 18:15, Wolfgang Grandegger wrote:
> Am 17.03.2017 um 16:50 schrieb Arnout Vandecappelle:
>>
>>
>> On 17-03-17 08:10, Wolfgang Grandegger wrote:
[snip]
>   # Replace the old path with the new one in all text files
>   while read FILE ; do
>       if file -b --mime-type "${FILE}" | grep -q '^text/' && [ "${FILE}" != "./usr/share/buildroot/sdk-location" ]
>       then
>           sed -i s,"${OLDPATH}","${NEWPATH}",g "${FILE}"
>       fi;
>   done < <(grep -lr "${OLDPATH}" .)
> 
> As grep -rl is very fast; I now use the following construct handling file with names
> with space corectly. BTW, is ',' is also a valid name character. Are all characters
> allowed for file names? Is there a known trick?

 All characters except / and \0 are allowed in file names. Look at [1] for a
long rant (and a number of good approaches) about this subject. Note that our
scripts don't have to be portable, so we can use e.g. find -print0. But your
proposal is pretty good, just needs 'read -r' insteade.

 So OLDPATH or NEWPATH could indeed contain a comma. You can check for that at
the beginning and error out.

 Regards,
 Arnout

[1] https://www.dwheeler.com/essays/filenames-in-shell.html

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
