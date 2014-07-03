From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Jul 2014 07:37:34 +0200
Subject: [Buildroot] Buildroot eclipse integration: doesn't work with
 custom BR2_HOST_DIR
In-Reply-To: <CAAXf6LVxOJ4h+CcYT1JGneo24OfymmqXrPdVN2C-UXKWg3eczw@mail.gmail.com>
References: <CAAXf6LVxOJ4h+CcYT1JGneo24OfymmqXrPdVN2C-UXKWg3eczw@mail.gmail.com>
Message-ID: <53B4EC1E.9030506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/06/14 15:45, Thomas De Schampheleire wrote:
> Hi,
> 
> Normally, BR2_HOST_DIR is $(BASE_DIR)/host which is
> <buildroot>/output/host. However, the user can set a custom
> BR2_HOST_DIR in the buildroot configuration.
> 
> If you do that, and select the registration of the toolchain against
> eclipse, you get:
> 
> ./support/scripts/eclipse-register-toolchain `readlink -f output`
> i686-pc-linux-gnu- "i586"
> Your project directory does not look like a Buildroot output
> make: *** [target-finalize] Error 1
> 
> This is because eclipse-register-toolchain script does:
> 
> if test ! -d ${project_directory}/host ; then
>     echo "Your project directory does not look like a Buildroot output"
>     exit 1
> fi
> 
> (where project_directory is the first parameter) and thus assumes that
> host is under <buildroot>/output which is not correct if you set
> BR2_HOST_DIR explicitly to a custom value.
> 
> I'm not sure about the internals of the Buildroot Eclipse plugin, so
> it is unclear to me which freedom we have regarding changing the
> helper script.

 Seems to me the solution is trivial: create a symlink host -> $(HOST_DIR), like
we do for staging -> $(STAGING_DIR).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
