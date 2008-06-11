From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 11 Jun 2008 15:37:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
In-Reply-To: <47D6EDED.5090506@carallon.com>
References: <20080306182758.09F16120295@busybox.net>	<1204829421.9461.81.camel@localhost>
	<47D6EDED.5090506@carallon.com>
Message-ID: <484FE342.3070405@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Wagner wrote:
>>> Log:
>>> patches for tslib
>>>
>>> Added:
>>>    trunk/buildroot/package/tslib/tslib-1.0-absbit.patch
>>>    trunk/buildroot/package/tslib/tslib-1.0-remove-return-on-error-from-check-df.patch
>> These two patches are actually wrong, I think the tslib error you (I)
>> see is because of big-endian architecture. I will hopefully give it a go
>> next week. As long as I remember it (-:
> 
> tslib-1.0-remove-return-on-error-from-check-df.patch is definitely wrong 
> - with this patch applied I get lots of error messages and inspecting 
> the code the patch removes code that is needed.
> 
> Not sure about the tslib-1.0-absbit.patch patch. I think it is correct 
> as you only need 16 bits as ABS_MAX is 0x3f
> 

Have looked at this again and the tslib-1.0-absbit.patch patch is 
definitely wrong. ABS_MAX is 0x3f which means that it needs 63 bits. 
There is a seperate bug with tslib though. The ioctl calls to get bit 
and absbit are wrong. They pass in the size as sizeof(bit) * 8 but the 
size should be in bytes and not bits. This means that it things the 
variables are very large. If absbit is declared as only 32 bits (as in 
the patch) then because of the size being passed to ioctl wrong that 
call zeros bits as it is adjacent on the stack. Although the test for 
EV_ABS has already passed is does mean that using_syn is never set.

I also think there is a performance optimisation that can be made. 
Currently ts_input_read() checks is sane_fd == 0 and if so calls 
check_fd(). I believe once the check has succeeded there is no need to 
call it again for the device (I don't think input device capabilities 
can change on the fly). The mechanism is already in place to do this, 
check_fd() just needs to return >0 on success.

Attached is a patch for those two issues.

Will.
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: tslib-1.0-checkfd_fixes.patch
Url: http://busybox.net/lists/buildroot/attachments/20080611/34cf45c2/attachment-0001.txt 
