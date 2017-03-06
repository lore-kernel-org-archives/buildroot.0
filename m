From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 6 Mar 2017 10:07:47 +0100
Subject: [Buildroot] [RFC PATCH 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <c8a4d85e-ff1a-44ab-832b-bd4eff235a00@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-3-git-send-email-wg@grandegger.com>
 <20170303154853.4eb15819@free-electrons.com>
 <c8a4d85e-ff1a-44ab-832b-bd4eff235a00@grandegger.com>
Message-ID: <8122b244-b97f-e0fd-6d15-a33b8f44af25@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 03.03.2017 um 17:39 schrieb Wolfgang Grandegger:
> Hello,
> 
> Am 03.03.2017 um 15:48 schrieb Thomas Petazzoni:
>> Hello,
>>
>> On Fri,  3 Mar 2017 15:18:46 +0100, Wolfgang Grandegger wrote:
>>> From: Samuel Martin <s.martin49@gmail.com>
>>>
>>> This commit introduces a fix-rpath script able to scan a tree,
>>> detect ELF files, check their RPATH and fix it in a proper way.
>>> The RPATH fixup is done by the patchelf utility using the option
>>> "--make-rpath-relative".
>>>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> ---
>>>  support/scripts/fix-rpath | 106
>>> ++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 106 insertions(+)
>>>  create mode 100755 support/scripts/fix-rpath
>>
>> Now that patchelf is much smarter, I am wondering if we still really
>> need a utility script just to call patchelf. Have you tried bringing
>> this logic into the make logic?
> 
> Well, I think three magic "find" oneliners could do the job. I will try
> and see.

Here are my current oneliners in the Makefile. It mainly shows what needs
to be done. Unfortunately, the scanning for ELF files may take rather
long:

 >>>   Sanitizing RPATH in target and staging directory
 time find /opt/bdo/x86_host/target -type f -print0 | xargs -0 -I {} sh -c \
	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/target \
	--no-standard-lib-dirs {}; fi"

  real	0m9.644s
  user	0m0.032s
  sys	0m0.360s

  time find /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot -type f -print0 | xargs -0 -I {} sh -c \
	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot \
	--no-standard-lib-dirs {}; fi"

  real	0m46.433s
  user	0m0.240s
  sys	0m1.980s

  >>>   Rendering the SDK relocatable
  cp /opt/bdo/x86_host/host/usr/bin/patchelf /opt/bdo/x86_host/host/usr/bin/patchelf.__copy__
  time find /opt/bdo/x86_host/host -path /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot -prune -o \
	-path /opt/bdo/x86_host/host/usr/bin/patchelf -prune -o -type f -print0 | xargs -0 -I {} sh -c \
	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/host {}; \
	fi"
  mv /opt/bdo/dcu_host/host/usr/bin/patchelf.__copy__ /opt/bdo/dcu_host/host/usr/bin/patchelf

  real	0m23.154s
  user	0m0.144s
  sys	0m1.124s


Using "file" to test if it's an ELF files is much slower. Using
"patchelf --print-rpath {} >/dev/null 2>&1" is much smarter and allows
to run the path sanitation without ignoring errors.

Because some ELF files are not writeable, we need a chmod first. For the
host tree, we also need special handling for patchelf to work around the
"file in use" issue.

"xargs" could be speedup using "-P NUM". Would that be an option?
We could also introduce BR2_TOOLCHAIN_RELOCATABLE. Any other idea to
speed up the scripts above?

Wolfgang.
