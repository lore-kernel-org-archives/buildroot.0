From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Dec 2019 00:02:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/spidermonkey: depends on host
 gcc >= 4.9
In-Reply-To: <20191205215828.7258d035@windsurf>
References: <20191204214913.718567-1-aduskett@gmail.com>
 <CAFSsvmoB=3gvY0-NaUFb09r73+0mx1z6ap=JED4-LLfBuD0-5w@mail.gmail.com>
 <20191205215828.7258d035@windsurf>
Message-ID: <349fd5c7-0116-119d-e928-44cf004facc2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/12/2019 21:58, Thomas Petazzoni wrote:
> On Wed, 4 Dec 2019 13:54:41 -0800
> Adam Duskett <aduskett@gmail.com> wrote:
> 
>> Before this get's added I do want to make another suggestion:
>>
>> Open embedded also has a patch that reverts the reliance on C++14
>> back to C++11, allowing the host GCC version to be >= 4.8.
>>
>> https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-extended/mozjs/mozjs/fallback-to-2011-C%2B%2B-standard.patch
> 
> So what this patch seems to imply is that in fact gcc 4.9 is not really
> required by the spidermonkey code. If that's the case, then yes I
> believe having the patch is probably nicer than having to propagate the
> dependency.

 As I understand it, spidermonkey *does* use C++14 features (hence the need for
target GCC 4.9+). However, it also builds host tools which need only C++11
features, but the test is applied to host and target compiler indiscriminately.
The patch doesn't make a correct distinction between host and target, it just
generally lowers the minimum C++ version.

 Now, given that they assume C++14 support is available, it's relatively likely
that they'll start using those features in future versions. At that point.
things will anyway break and we need this condition. So I'd say, byte the bullet
now and require hsot and target GCC >= 4.9.

 Regards,
 Arnout
