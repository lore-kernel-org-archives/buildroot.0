From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 6 Oct 2020 23:14:07 +0000
Subject: [Buildroot] [PATCH v2 3/6] package/elf2flt: add RISC-V support
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-4-damien.lemoal@wdc.com>
 <20201006234750.30ae4241@windsurf.home>
Message-ID: <CY4PR04MB37519D62426A95C3D21DFDE3E70D0@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/10/07 6:47, Thomas Petazzoni wrote:
> On Tue,  8 Sep 2020 20:33:21 +0900
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
>> From: Christoph Hellwig <hch@lst.de>
>>
>> Enable selecting elf2flt for RISC-V no MMU builds ad add support for it.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  .../0002-elf2flt-add-riscv-support.patch      | 302 ++++++++++++++++++
>>  package/elf2flt/Config.in.host                |   2 +-
>>  2 files changed, 303 insertions(+), 1 deletion(-)
>>  create mode 100644 package/elf2flt/0002-elf2flt-add-riscv-support.patch
>>
>> diff --git a/package/elf2flt/0002-elf2flt-add-riscv-support.patch b/package/elf2flt/0002-elf2flt-add-riscv-support.patch
>> new file mode 100644
>> index 0000000000..2f3ce5ac69
>> --- /dev/null
>> +++ b/package/elf2flt/0002-elf2flt-add-riscv-support.patch
>> @@ -0,0 +1,302 @@
>> +From 9a1c84590f31897e681a8142481c73456a7eedcf Mon Sep 17 00:00:00 2001
>> +From: Christoph Hellwig <hch@lst.de>
>> +Date: Mon, 10 Jun 2019 09:21:57 +0200
>> +Subject: elf2flt: add riscv support
>> +
>> +We need a new linker script - riscv has a global_pointer and is
>> +very picky about some section ordering.
>> +
>> +Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> We need your Signed-off-by here. However, I see that the upstreaming
> process hasn't really made progress, and especially you're pointing
> that binaries built with this elf2flt RISC-V support fail with recent
> kernels.

The problem is commit 2217b982624680d19a80ebb4600d05c8586c4f96 in kernel 5.9.
Without reverting this commit (which is a revert itself), busybox fails to run
(invalid instruction or address exception triggers after loading the flat bin
and jumping into the init process, which in my case is a shell script). This
commit was backported into 5.8.5 too, so all kernels from that version onward
fail to run busybox, including 5.9. Everything is fine if that  commit is reverted.

> Do you have some news about fixing this? It's a bit annoying to merge
> something that doesn't work with recent kernels.

Indeed. I am super annoyed by it too :) The kernel commit should not matter as
it only changes relocation of sections on load by a factor of 8B. With or
without it, the flat bin should be OK, loaded and relocated and run. Yet a bad
address is there. No clue yet as to what the exact problem is and I have had no
time to explore this in more detail. This is why I did not send an updated PR
for buildroot.

The elf2flt PR I sent to uclinux-dev also needs some more work as commented on
github PR page. Need to work on that too, but since I suspect the kernel side
problem is related to it, I need to find the time to dig into this further. Not
quite sure yet if the problem is with the kernel, elf2flt or both.

> 
> Thomas
> 


-- 
Damien Le Moal
Western Digital Research
