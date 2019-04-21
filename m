From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Apr 2019 09:36:18 +0200
Subject: [Buildroot] [PATCH] linux-tools/perf: Respect TARGET_CFLAGS
In-Reply-To: <20190418114336.61f3f404@windsurf>
References: <20190418093902.41835-1-abrodkin@synopsys.com>
 <20190418114336.61f3f404@windsurf>
Message-ID: <ea5f11a1-a7cb-4cee-dfda-64d55d550d83@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/04/2019 11:43, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 18 Apr 2019 12:39:02 +0300
> Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> 
>> perf uses its own build-system and doesn't respect externally set flags.
>> Let's force it to use target flags as perf utility is nothing but
>> an ordinary user-space application.
>>
>> This among other things is required to build perf for ARC700 for which
>> we pass "-matomic" via TARGET_ABI, see [1] for more details.
>>
>> [1] https://patchwork.ozlabs.org/patch/1087471/
>>
>> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>> ---
>>  package/linux-tools/linux-tool-perf.mk.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
>> index 80e00c3c56..e7565773c4 100644
>> --- a/package/linux-tools/linux-tool-perf.mk.in
>> +++ b/package/linux-tools/linux-tool-perf.mk.in
>> @@ -19,6 +19,7 @@ PERF_MAKE_FLAGS = \
>>  	JOBS=$(PARALLEL_JOBS) \
>>  	ARCH=$(PERF_ARCH) \
>>  	DESTDIR=$(TARGET_DIR) \
>> +	EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
> 
> The change is OK, but I believe that if -matomic is really a
> core/important CFLAGS on ARC, then we should ideally pass it through
> the toolchain wrapper, so that we are sure it is always passed.
> 
> Arnout, what do you think?

 +1.

 Thomas, last year we made a beginning of deciding what should go through the
wrapper and what through CFLAGS, but I'm not sure if we ever got to a conclusion?

 Regards,
 Arnout
