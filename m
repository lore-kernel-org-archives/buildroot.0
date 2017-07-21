From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 21 Jul 2017 09:35:14 +0200
Subject: [Buildroot] [PATCH v8 03/10] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <53db2a2d-2211-b173-8e37-19f55afe49de@mind.be>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-4-git-send-email-wg@grandegger.com>
 <20170720224906.301f524a@windsurf>
 <53db2a2d-2211-b173-8e37-19f55afe49de@mind.be>
Message-ID: <a92d7a30-8892-a99f-2165-268c4a3a06d6@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 20.07.2017 um 23:05 schrieb Arnout Vandecappelle:
> 
> 
> On 20-07-17 22:49, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Thu, 20 Jul 2017 16:35:14 +0200, Wolfgang Grandegger wrote:
>>> From: Samuel Martin <s.martin49@gmail.com>
>>>
>>> This commit introduces the script "fix-rpath" able to scan a tree,
>>> detect ELF files, check their RPATH and fix it in a proper way.
>>> The RPATH fixup is done by the patchelf utility using the option
>>> "--make-rpath-relative <root-directory>".
>>>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>> ---
>>>   support/scripts/fix-rpath | 133 ++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 133 insertions(+)
>>>   create mode 100755 support/scripts/fix-rpath
>>
>> I've applied to master, after removing trailing slashes.
> 
>   Which trailing slashes?
> 
> 
>> However, I noticed that when patchelf is not available in HOST_DIR,
>> this script does nothing, but doesn't show any error:
>>
>> thomas at windsurf:~/projets/buildroot (master)$ rm output/host/usr/bin/patchelf
>> thomas at windsurf:~/projets/buildroot (master)$ make
>> [...]
>>>>>    Sanitizing RPATH in target tree
>> /home/thomas/projets/buildroot/support/scripts/fix-rpath target
>> thomas at windsurf:~/projets/buildroot (master)$
>>
>> This is a little bit disturbing, so I believe it should be fixed in a
>> follow-up patch.
> 
>   Right! That's because the "if ${PATCHELF} ..." just fails and the error is
> redirected to /dev/null.
> 
>   Better check if ${PATCHELF} is executable somewhere in the beginning.
> 
>   However, there is never a guarantee. If e.g. it would be missing a shared
> library, it would still fail in the same way. To be really sure, you'd have do
> e.g. call patchelf on itself to verify it is actually working.


Or you can set "PATCHELF_DEBUG=1" to check what patchelf is doing.

Wolfgang.
