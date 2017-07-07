From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 22:59:54 +0200
Subject: [Buildroot] [PATCH] packages: remove numerous dependencies on
 Busybox
In-Reply-To: <20170707184516.5948-1-thomas.petazzoni@free-electrons.com>
References: <20170707184516.5948-1-thomas.petazzoni@free-electrons.com>
Message-ID: <6b275e3c-0d21-4704-4ed6-e2f3c44ce5e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

 You really like the big boring patches, don't you?

On 07-07-17 20:45, Thomas Petazzoni wrote:
> A lot of packages that provide a full-featured version of a tool
> otherwise provided in a more lightweight version in Busybox add a
> <pkg>_DEPENDENCIES on the busybox package to ensure they get built and
> installed after Busybox and therefore overwrite the Busybox symbolic
> links.
> 
> However, the Busybox installation process does not overwrite existing
> files when creating its symbolic links. For example, if dos2unix has
> already been installed in its full-featured version, the Busybox
> installation process will not overwrite it.

 It is important to note that this is only true because we explicitly tell
busybox to do so. See lines 249-253 in busybox.mk.


> Therefore, making all those packages depend on busybox if available is
> not necessary, and we consequently drop such dependencies.
> 
> A few packages still depend on Busybox if available:
> 
>  - The logging related packages (syslog-ng, rsyslog, sysklogd),
>    because they install a S01logging script that should overwrite the
>    one installed by Busybox.

 I double-checked that there are no others with the same problem. S50telnetd
sounds risky, but we no longer have a telnetd package. inittab is also created
by sysvinit, but busybox.mk only creates it if BR2_INIT_BUSYBOX.


>  - The systemd package, for a mysterious reason documented in
>    systemd.mk "Make sure that systemd will always be built after
>    busybox so that we have a consistent init setup between two builds"
> 
> After building a number of packages providing full-featured versions
> of tools also provided by Busybox, and forcing the Busybox
> installation afterwards, the Busybox installation process says:
[snip]
> And therefore none of those programs were overwritten by Busybox
> symbolic links.

 I double-checked this for some e2fsprogs and util-linux binaries, and with
BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES=y.

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

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
