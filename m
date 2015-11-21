From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Nov 2015 23:17:26 +0100
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <CAFGQKxd7LUYDN-whwsdhenu=bMJXnd7nQ=ungrxvt2NnMG5fiA@mail.gmail.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
 <CAFGQKxd7LUYDN-whwsdhenu=bMJXnd7nQ=ungrxvt2NnMG5fiA@mail.gmail.com>
Message-ID: <5650ED76.6070409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-11-15 15:45, Martin Bark wrote:
> Thomas, All,
> 
> On 19 November 2015 at 23:15, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> J?r?me, Johan, Bernd, Yann, Martin, Gustavo, R?mi, Samuel, Alexey,
>> Waldemar, Clayton, please read below, there are some interesting issues
>> for you :-) Thanks !
>>
>> On Thu, 19 Nov 2015 08:30:13 +0100 (CET), Thomas Petazzoni wrote:

[snip]

>>>       x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/3fd1d18f0535bb8b969f808a5837c4a8111e69b9/
>>
>> Seems like nodejs doesn't like the native gcc 4.7 that this machine
>> uses. Martin, can you have a look ?
>>
>> BTW Martin, there's also this other error that popped up on a different
>> machine:
>> http://autobuild.buildroot.org/results/72b/72b80a434547931e1deb6f0ba793a6d68accc9a2/build-end.log.
> 
> Yes i think you're right, the issue looks like gcc 4.7 on the host.
> This issue https://github.com/nodejs/node-gyp/issues/790 and this one
> https://github.com/nodejs/node/issues/432 have similar build issues
> and they both come down to node.js needs at least gcc 4.8
> 
> The Config.in already has BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 for node.js
> 4.x, is there a way to specify this for the host build too?

 There currently isn't.

 I will try to make a patch that adds BR2_HOST_GCC_AT_LEAST_*, but I don't have
the older gcc to test it with. There are three packages that have
BR2_TOOLCHAIN_GCC_AT_LEAST and that also have a host variant:

- nodejs (4.8)
- directfb (4.5), but host-directfb is not used and never has been used
- cmake (4.7), but that's only needed for ctest which needs jsoncpp which
doesn't have a host variant.

 So probably only nodejs will need this, but it would be good to test host-cmake
with gcc 4.6 or earlier. Does anyone have that lying around?

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
