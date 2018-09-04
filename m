From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Sep 2018 00:43:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-08-30
In-Reply-To: <20180904114512.153df013@windsurf>
References: <20180831060016.342FF22A3A@mail.bootlin.com>
 <241764101.4041403.1535918222698.JavaMail.zimbra@datacom.com.br>
 <CANQCQpZxci70YBUJAfJ12RTjDtPBeD8M-3H4b_6EVMUe+oB9jQ@mail.gmail.com>
 <CANQCQpbSwyZXQZyOgG2-kcPFS0HcJENhzZWg9oCjaDRx5FWwYA@mail.gmail.com>
 <20180904114512.153df013@windsurf>
Message-ID: <a9927d39-0d18-8d49-7ac6-07ac9dfb4daa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/09/2018 11:45, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 3 Sep 2018 14:49:24 -0500, Matthew Weber wrote:
> 
>> Figured it out, the python3 bump and the addition of the python uuid
>> dependency on util-linux, created a circular dependency making
>> libselinux and util-linux build out of order.
>> (6e7e733f3bb)
> 
> So, if I get it right, the circular dependency is:
> 
>  util-linux -> libselinux -> python3 -> util-linux
> 
> But wait, I realize that there is worse, with the Python libuuid thing,
> we have the following circular dependency as well:
> 
>  util-linux -> python3 -> util-linux
> 
> So that last one we can fix by introducing python-util-linux, as I was
> suggesting to also solve the BlueZ related circular:
> 
>   http://lists.busybox.net/pipermail/buildroot/2018-August/229558.html
> 
> But that first one is different, because it won't be solved by moving
> the util-linux Python bindings to a separate package. To solve:
> 
>  util-linux -> libselinux -> python3 -> util-linux
> 
> then we need to create python-libselinux, which will build/install the
> python bindings of libselinux. This way util-linux -> libselinux will
> not pull in a python3 dependency. This should be doable, because
> libselinux has separate make targets for building/installing the python
> bindings.
> 
> These circular dependencies are annoying.

 I checked how Fedora solves it. They don't - the spec file for python3 has a
BuildRequires of libuuid-devel, and util-linux has a BuildRequires of
python3-devel. I guess it's no longer possible to bootstrap Fedora from source...

 So what does gentoo do? They simply don't have a dependency on util-linux in
the python3.7.0.ebuild. Indeed, it turns out that the _uuid module is entirely
optional. It is only used to access the uuid_generate_time_safe() function, but
the uuid.py module can also get this function through ctypes (i.e. dlopen()). So
perhaps a simpler solution is to just remove the build-time python3 ->
util-linux dependency? Runtime is still needed to support the dlopen path.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
