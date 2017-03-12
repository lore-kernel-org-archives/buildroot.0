From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sun, 12 Mar 2017 21:58:01 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
Message-ID: <87e32239-f0d8-0036-cec2-007f765961db@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 12.03.2017 um 21:27 schrieb Arnout Vandecappelle:
>
>
> On 12-03-17 18:49, Thomas Petazzoni wrote:
...snip...
>
>> +# In order to avoid matching firmware files that could have the ELF
>> +# format, but for other architectures, we only look in bin, lib, sbin,
>> +# usr/bin, usr/lib and usr/sbin
>> +for f in $(find ${TARGET_DIR}/{usr/,}{bin,lib,sbin} -type f) ; do
>> +    # Skip non-ELF files
>> +    if ! file -b ${f} | grep -q "ELF " ; then
>
>  As observed by Wolfgang in the context of rpath sanitisation, file is pretty
> inefficient. We came to the conclusion that the most efficient is just checking
> the first 4 bytes (0x7f 0x45 0x4c 0x46). Since it is also needed for the rpath
> sanitisation, perhaps we should have a common script, or even compiled code, to
> do this check.
>
>  Note however that just checking the first 4 bytes gives a bunch of false
> positives, so we'd have to ignore errors from readelf as well.

Using readelf for ELF file checking is as fast checking the first 4 
bytes. My favorite solution is:

       header=$(readelf -h "${f}" 2>/dev/null)
       if [ "$?" -eq 0 ]; then
	... process header ...
       fi

Wolfgang.
