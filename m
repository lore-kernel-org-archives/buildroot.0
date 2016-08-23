From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 24 Aug 2016 00:05:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-08-22
In-Reply-To: <ac3757b1-2890-3670-22cd-6b655c878f06@gmail.com>
References: <20160823093702.D278F1093B5@stock.ovh.net>
 <aabf8490-2a2f-8b5b-5edb-15a83ed00924@gmail.com>
 <ac3757b1-2890-3670-22cd-6b655c878f06@gmail.com>
Message-ID: <639f880e-4f5a-d350-cba5-d6ea40af3048@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 23/08/2016 ? 22:33, Romain Naour a ?crit :
> Hello,
>>>
>>> Build statistics for 2016-08-22
>>> ================================
>>>
>>>       successes : 158
>>>        failures : 43 
>>>        timeouts : 1  
>>>           TOTAL : 202
>>>
>>> Classification of failures by reason
>>> ====================================
>>>
>>>                  lvm2-2.02.162 | 4 
>>>
>>> Detail of failures
>>> ===================
>>>
>>>          arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/3d4df873a3d4fa199e03d8aa8694eafeac474e5a
>>>       x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/407ccac95d02715ef9059b9a1282e21dc465af98
>>>          arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/07e25821bb7538f765af1f9c9513998e86f3ec5e
>>>       x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/ea39becf5561d1fd4c9535ee1225b8ddc859bafe
>>
>> What do we do for lvm2 with musl ?
>> Bernd proposed a fix [1] and reported the issue on the lvm2 mailing list [2].
>> Several version bump has been done since then.
> 
> I noticed that lvm2 has been updated to the latest version 2.02.163 and it seems
> to fix the musl issue thanks to this commit [1].
> I'm not sure we can easily backport it to 2.02.162 but lvm2 is no longer an
> issue with musl :) (lvm2 needs to be runtime tested though)
> 
> Best regards,
> Romain
> 
> [1]
> https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=06ce9b4e4238da58d6c2acda7878dbc51245a8fc

So, things are better with 2.02.163 but only if BR2_PACKAGE_LVM2 is set (other
lvm2 options are not set).

If BR2_PACKAGE_LVM2_STANDARD_INSTALL is set, we need the small patch from Bernd
0002-mallinfo.patch.

But if BR2_PACKAGE_LVM2_APP_LIBRARY is set the build fail with the same error
(even with master):

lvmcmdline.c: In function ?_check_standard_fds?:
lvmcmdline.c:1810:14: error: assignment of read-only variable ?stdin?
      !(stdin = fopen(_PATH_DEVNULL, "r"))) {

So lets disable lvm2 for musl.

Best regards,
Romain

> 
>>
>> Best regards,
>> Romain
>>
>> [1] http://patchwork.ozlabs.org/patch/573519/
>> [2] https://www.redhat.com/archives/linux-lvm/2016-February/msg00024.html
>>
> 
