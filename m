From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 8 Oct 2016 12:22:02 +0200
Subject: [Buildroot] [PATCH] package/wvstreams: add patch to fix build
 with C99 compilers
In-Reply-To: <5017ebbe-e45d-f80c-4c75-63f5c4ff20f6@mind.be>
References: <20160923214227.12888-1-joerg.krause@embedded.rocks>
 <9fbfd5af-6933-9b6e-6898-9bcea17e22a1@gmail.com>
 <A6BEEF15-B2C6-49FA-8D0F-A3F127248835@embedded.rocks>
 <5017ebbe-e45d-f80c-4c75-63f5c4ff20f6@mind.be>
Message-ID: <1ee46916-6643-a61a-05c0-0760ea3e9324@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg, Arnout, All

Le 24/09/2016 ? 18:14, Arnout Vandecappelle a ?crit :
> 
> 
> On 24-09-16 10:47, J?rg Krause wrote:
>>
>>
>> Hi Romain,
>>
>> Am 24. September 2016 10:31:57 MESZ, schrieb Romain Naour <romain.naour@gmail.com>:
>>> Hi J?rg,
>>>
>>> Le 23/09/2016 ? 23:42, J?rg Krause a ?crit :
> [snip]
>>>> Note, that wvstreams is not maintained anymore. Last activity was on
>>>> Github was 2011, the current version 1.6.1 dates from 2009.
>>>
>>> Thanks for this investigation and the fix.
>>> Are you using wvstreams or it's for the sake of autobuilders ?
>>
>> No, I am not using wvstreams and yes, it is for the sake of autobuilders.
>>
>>> I'm wondering if we should deprecate this package ?
>>> Last time I looked at it, I disabled it for musl based toolchains.
>>>
>>> Thoughts ?
>>
>> I am not sure which policy Buildroot follows here, but I would like to know.
> 
>  This is precisely the kind of situation where we start considering deprecating
> a package.
> 
> 
>  In this case, wvstreams only exists for the sake of wvdial. I don't know of
> many alternatives however. modem-manager is somewhat bloaty, and chat + ppp.conf
> is a lot more difficult.
> 
> 
>  Adding Simon, the original contributor, for a second opinion.

I build tested this patch and indeed it fix the build with gcc5.
But I tested with gcc6 and it fail with a weird C++ error:

streams/wvstream.cc: In member function ?void
WvStream::_build_selectinfo(IWvStream::SelectInfo&, time_t, bool, bool, bool,
bool)?:
streams/wvstream.cc:910:22: error: cannot convert ?IWvStreamCallback {aka
std::tr1::function<void()>}? to ?bool? in assignment
  si.wants.readable = readcb;
                      ^~~~~~
streams/wvstream.cc:911:22: error: cannot convert ?IWvStreamCallback {aka
std::tr1::function<void()>}? to ?bool? in assignment
  si.wants.writable = writecb;
                      ^~~~~~~
streams/wvstream.cc:912:25: error: cannot convert ?IWvStreamCallback {aka
std::tr1::function<void()>}? to ?bool? in assignment
  si.wants.isexception = exceptcb;
                         ^~~~~~~~
streams/wvstream.cc: In member function ?IWvStream::SelectRequest
WvStream::get_select_request()?:
streams/wvstream.cc:1022:62: error: no matching function for call to
?IWvStream::SelectRequest::SelectRequest(IWvStreamCallback&, IWvStreamCallback&,
IWvStreamCallback&)?
     return IWvStream::SelectRequest(readcb, writecb, exceptcb);
                                                              ^
So, let's deprecate wvdial and wvstreams.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
