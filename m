From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Dec 2017 12:39:47 +0100
Subject: [Buildroot] [PATCH 3/3] package/vlc: switch to libupnp-1.8
In-Reply-To: <CAPi7W81GGiGTOWqG3GeK6CRpYAP9gdLZnyGXLHQ1UJQ76mzfZA@mail.gmail.com>
References: <20171214073134.28696-1-bernd.kuhls@t-online.de>
 <20171214073134.28696-3-bernd.kuhls@t-online.de>
 <CAPi7W81zkH=n-1yXvuCri+99H7WGvQM5Gv9BbKa6Vj7Bt027rA@mail.gmail.com>
 <a91f21b1-8503-167f-11ce-83ab99b98498@t-online.de>
 <CAPi7W81GGiGTOWqG3GeK6CRpYAP9gdLZnyGXLHQ1UJQ76mzfZA@mail.gmail.com>
Message-ID: <CAPi7W8191mtTX135inFys4s0U9+hfvkuN0PjSQ0PzKc+aGgLgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Finally, the issue was in vlc, I will send a patch ASAP.

Best Regards,

Fabrice

2017-12-16 23:20 GMT+01:00 Fabrice Fontaine <fontaine.fabrice@gmail.com>:

> Dear Bernd,
>
> Thanks for investigating, I found the issue.
> In libupnp 1.6.x, the Event in Upnp_FunPtr was a simple void:
> https://github.com/mrjimenez/pupnp/blob/branch-1.6.x/upnp/inc/upnp.h
> However, it was changed to a const void* in 1.8.x:
> https://github.com/mrjimenez/pupnp/blob/master/upnp/inc/Callback.h
>
> I will report the issue upstream and fix it by patching one of the version
> of libupnp upstream (probably pupnp18).
>
> Best Regards,
>
> Fabrice
>
>
> 2017-12-16 19:41 GMT+01:00 Bernd Kuhls <bernd.kuhls@t-online.de>:
>
>> Am 14.12.2017 um 09:13 schrieb Fabrice Fontaine:
>> > Dear Bernd,
>> >
>> > I don't think this is the right fix, vlc is compatible with both
>> > versions of libupnp (1.6.x and 1.8.x).
>> > However, libupnp 1.6.23 added its own compat code so I think we should
>> > apply this commit (from mainstream) to fix the issue with 1.6.x:
>> > https://github.com/videolan/vlc/commit/f9c5a343f1a8cad9c2c15
>> 3f9c05e4e7201675a43#diff-99aaf215e619208a327a2e41f97c59c1.
>> >
>> > Best regards,
>> >
>> > Fabrice
>>
>> Hi,
>>
>> backporting this patch does not fix the build of vlc-2.2.8 with
>> libupnp-1.6.24 using this defconfig:
>>
>> http://autobuild.buildroot.net/results/6bc/6bc47577819035e63
>> a7acbfb6eee12af56966644/defconfig
>>
>> services_discovery/upnp.cpp: In function 'int Open(vlc_object_t*)':
>> services_discovery/upnp.cpp:174:71: error: invalid conversion from 'int
>> (*)(Upnp_EventType, UpnpEventPtr, void*) {aka int (*)(Upnp_EventType_e,
>> const void*, void*)}' to 'Upnp_FunPtr {aka int (*)(Upnp_EventType_e,
>> void*, void*)}' [-fpermissive]
>>      i_res = UpnpRegisterClient( Callback, p_sd, &p_sys->client_handle );
>>
>> Regards, Bernd
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171217/db699c47/attachment.html>
