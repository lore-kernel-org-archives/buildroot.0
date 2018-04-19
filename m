From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Apr 2018 01:18:26 +0200
Subject: [Buildroot] [PATCH 1/1] reaver: add missing dependency on non
 static lib.
In-Reply-To: <CAJe0E3fi6_Yj6SEqkGp2s5h4nDZgQdDK_egJCoA9CjRLqaLMyQ@mail.gmail.com>
References: <1524069781-671-1-git-send-email-guillaume.bressaix@gmail.com>
 <42941498-53f1-e48d-5a75-78493ad701d6@mind.be>
 <CAJe0E3fi6_Yj6SEqkGp2s5h4nDZgQdDK_egJCoA9CjRLqaLMyQ@mail.gmail.com>
Message-ID: <b81b22a0-c300-0133-a925-bfbfa44b1013@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


[Please don't top-post, but reply in-line like I do below.]

On 19-04-18 23:35, Guillaume William Bres wrote:
> Thank you, yes you are right.
> 
> I improved my methods, I reproduced the build error here by copying the config
> file. I improved things a little bit with
> 
> ifeq ($(BR2_STATIC_LIBS),y) # --static seems to cause the pb
> REAVER_CONF_ENV += ac_cv_lib_pcap_pcap_open_live=yes
> endif
> 
> it's less dramatic but still a dirty work around:?
> libpcap is properly selected by the package, so has been previously downloaded &
> installed by buildroot. -lpcap is properly passed to the linker from my first
> submission. Yet pcap_open_live test by configure still fails. My understanding
> is the line I just added avoids testing "pcap_open_live" which causes a failure.
> Dunno if you're okay with that.
> 
> Make now actually proceeds further & produces some new errors, yet still somehow
> related to pcap, I could use your input on them:
> 
> step that fails now:
> $buildroot/output/host/mips64el-buildroot-linux-uclibc/sysroot/usr/lib64/../lib64/libpcap.a(pcap-dbus.o):
> In function `dbus_write':
> pcap-dbus.c:(.text+0x48): undefined reference to `dbus_message_demarshal'
> pcap-dbus.c:(.text+0x8c): undefined reference to `dbus_message_demarshal'

 It's the same issue, but now with a different symptom.

 The issue is that libpcap itself is linked against other libraries. In the
dynamic library case, there are NEEDED entries in the .so file that point to
these other libraries. In this case, the linker will implicitly search for those
other libraries as if they had been given with -l on the command line. However,
in a static .a library, these NEEDED entries don't exist. Therefore, the linker
can't know that when you link with -lpcap, that it also needs to do -ldbus etc.
Therefore you get undefined reference errors.

 The solution, as I wrote, is to use pcap-config, which will enumerate all the
libraries that libpcap needs.

 Regards,
 Arnout

> 
> I started googling & looking at dbus related packages but haven't made any
> progress yet
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
