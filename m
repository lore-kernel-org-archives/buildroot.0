From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Apr 2019 23:00:04 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-04-11 (libcamera-uClibc support)
In-Reply-To: <96eb1348-eeef-8fee-9b82-053fc10b2097@ideasonboard.com>
References: <5cb02eac.1c69fb81.6a317.08faSMTPIN_ADDED_MISSING@mx.google.com>
 <96eb1348-eeef-8fee-9b82-053fc10b2097@ideasonboard.com>
Message-ID: <8d10cf03-41bb-e594-8d4f-7a9d049fbe3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2019 11:06, Kieran Bingham wrote:
[snip]
> Alternatively, we could extend our secure_getenv() such that on uClibc
> we use 'issetugid()' which was added at [0]:
> 
>> [0] https://git.busybox.net/uClibc/commit/?id=94246e65e20b5390d53858447526b231ef1afd67
> 
> 
> In fact, that commit references a commit [1] at MUSL with a very well
> written commit message describing the issue:
> 
>> [1] http://git.musl-libc.org/cgit/musl/commit/?id=ddddec106fd17c3aca3287005d21e92f742aa9d4
> 
> Then there is also a very good write up of this topic at [2] showing why
> this complexity has come to exist...
> 
>> [2] issetugid() sadness 
>>     https://gist.github.com/nicowilliams/4daf74a3a0c86848d3cbd9d0cdb5e26e
> 
> And that one makes me just want to disable libcamera for uClibc or any
> other unsupported system instead.

 All three these sources seem to suggest that using a proper issetugid() (which
uClibc and musl do provide) would be the right thing to do, no? Your reference
[1] pretty much explains that using getauxval(AT_SECURE) is not such a great
idea. For glibc (which doesn't have issetugid) there is no problem because it
already provides secure_getenv().

 If I understand [2] correctly, the only problem with just using issetugid() is
that it doesn't work at all on OpenBSD and its variants.


> Thomas, I assume other projects have to deal with this same issue, how
> do they do it? Is there a generic way to solve this for all platforms?

 AFAIK we haven't seen this issue before.


> I'm leaning towards just disabling builds on uClibc for now as we are
> unlikely to get many users of libcamera with uClibc ... ? And we could
> always revisit the topic later if someone decided they did want to use
> it there.

 It's not exactly clear to me how musl differs from uClibc here. Except that
musl does provide getauxval (and in fact it redirects the call to
getauxval(AT_SECURE) to issetugid()).

 Regards,
 Arnout
