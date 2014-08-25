From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Aug 2014 21:16:17 +0200
Subject: [Buildroot] [PATCH v2 2/6] gendoc infra: move manual build
	location into $(BUILD_DIR)/manual
In-Reply-To: <CAAXf6LVh_LowU4GNuBs9wbdecDN9w6rccaykFH-qKqR32bBfnQ@mail.gmail.com>
References: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
 <1408652748-14708-3-git-send-email-s.martin49@gmail.com>
 <CAAXf6LVh_LowU4GNuBs9wbdecDN9w6rccaykFH-qKqR32bBfnQ@mail.gmail.com>
Message-ID: <CAHXCMMJKMh3pHXerC7ikeWCAYFh9FFSHfVsRZ0aWs51mFuuGTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 22, 2014 at 2:44 PM, Thomas De Schampheleire
<thomas.de.schampheleire@gmail.com> wrote:
> Hi Samuel,
>
> On Thu, Aug 21, 2014 at 10:25 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> This patch reworks the mannual source preparetion by:
>
> manual
> preparation
>
>> - moving the build directory under $(BUILD_DIR)/, this keeps consistency
>>   with the other Buildroot infrastructure;
>
> infrastructures
>
>> - adding a couple of targets: 'manual-rsync' and 'manual-prepare-sources',
>>   to deal more efficiently the manual sources and avoid rsync-ing them on
>
> _with_ the manual sources
>
>>   every single manual-* target.
>>
>> The 'manual-rsync' target only copy the manual sources under git, while
>
> copies
>
>> the 'manual-prepare-sources' also takes care of the generated ones. These
>> targets are now run only once,  and the manual build is no longer cleaned
>> after each manual format generation.
>>
>> Now, the 'manual-clean' target only remove the manual build directory, but
>> keep the output one $(O)/output/doc/manual unchanged.
>
> keeps
>
>>
>> Doing so (moving the manual build directory and keeping it between 2
>> manual format generation) ensures that all generated sources are taking
>
> taken
>
>> in account when generating the manual [1].
>>
>> [1] http://lists.busybox.net/pipermail/buildroot/2014-August/104421.html
>>
>> Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> changes v1 -> v2:
>> - remove trailing '\'
>> ---
>>  docs/manual/manual.mk | 24 ++++++++++++++++--------
>>  1 file changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
>> index 136f725..044557d 100644
>> --- a/docs/manual/manual.mk
>> +++ b/docs/manual/manual.mk
>> @@ -1,11 +1,20 @@
>> +$(BUILD_DIR)/$(pkgname):
>> +       $(Q)mkdir -p $@
>> +
>> +manual-rsync: $(BUILD_DIR)/$(pkgname)
>> +       $(Q)$(call MESSAGE,"Preparing the manual sources...")
>> +       $(Q)rsync -au docs/$(pkgname)/ $(BUILD_DIR)/$(pkgname)
>
> Why are you using 'rsync -au' and not 'rsync -a'?
> -u means: "-u, --update : skip files that are newer on the receiver"
> and I can't see why we would want that behavior?
>
> I realize that this was already present in the original code, but
> still I wonder if it's needed.

As you noticed, I just keep the original code. But that's true, we
certainly don't want the '-u' behavior.
I'll change this in the next submission (+ all the typoes pointed out
above ;-]).

Regards,

-- 
Samuel
