From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Jun 2017 17:43:20 +0200
Subject: [Buildroot] [PATCH v2 1/4] libressl: new package
In-Reply-To: <CAFSsvmpbSrDYjRBxboYqQD9p0LLVAPiHw-YpV782KLZqMY8q3Q@mail.gmail.com>
References: <20170624172900.3610-1-Adamduskett@outlook.com>
 <05c9f4ef-b164-94f5-7f64-dc58a8a07497@mind.be>
 <CAFSsvmpbSrDYjRBxboYqQD9p0LLVAPiHw-YpV782KLZqMY8q3Q@mail.gmail.com>
Message-ID: <93dbe81e-6150-ba6f-d728-793ecf79ca95@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-06-17 15:15, Adam Duskett wrote:
[snip]
>>> +$(eval $(autotools-package))
>>> +$(eval $(host-autotools-package))
>>  Since the host package isn't used, it shouldn't be added here. Or if you do
>> have a reason to provide the host package, please mention in the commit log.
>>
> I will provide host-virtual-package.  It was a oversight on my part.

 Hang on though: I'm not so sure we want host-libssl.

 There are some packages that currently depend on host-openssl while the target
package doesn't select openssl. For example, host-erlang (needed for host-rebar,
needed to build and install erlang/rebar packages) unconditionally depends on
host-openssl, but for the target erlang it's configurable. If such a package
really requires openssl and not libressl, it means that the host package can no
longer be built when libressl is selected. Worse yet, it can fail in weird ways,
because it is possible that both host-openssl and host-libressl are built and
then depending on the build order either one of them actually gets installed...

 Therefore, I think it's more appropriate to drop host-libssl (and
host-libressl), and always use openssl for the host packages. The only
disadvantage to this as far as I can see is that openssl takes a little longer
to build than libressl.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
