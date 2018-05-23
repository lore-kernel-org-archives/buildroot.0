From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 May 2018 00:20:12 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: filter microblaze GCC
 < 8 bug
In-Reply-To: <1527112426-21842-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1527112426-21842-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <395ca457-f279-63c0-2042-dd47ef387d66@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-05-18 23:53, Matt Weber wrote:
> Works around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> which is an issue where the Microblaze archtecture had code that
> caused a infinite recursion while optimizing in versions of GCC
> less then 8.x.  More BR discussion can be found on this thread.
> http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2018-04-25-td192721.html
> 
> CC: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> 
> Note: I do not have a good way to test this.

 You do:

echo 'support/config-fragments/autobuild/br-microblazeel-full.config,x86_64' \
   > /tmp/toolchains.csv
while true; do
   ./utils/genrandconfig --toolchains-csv /tmp/toolchains.csv
   grep 'BR2_PACKAGE_\(BOOST\|FLARE_ENGINE\|GST_FFMPEG\)=y' .config && break
done

 If it doesn't fail after a couple of minutes, it should be OK.

> 
> ---
>  utils/genrandconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 06701ce..bf7c4bc 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -320,6 +320,21 @@ def fixup_config(configfile):
>      if 'BR2_or1k=y\n' in configlines and \
>         'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
>          return False
> +    # The microblaze uclibc build hangs on GCC < 8.x (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180)
> +    # http://autobuild.buildroot.net/results/40d/40d33ff9e3367a22253c58b388c77d9858981bff/
> +    if 'BR2_PACKAGE_BOOST=y\n' in configlines and \
> +       BR2_TOOLCHAIN_EXTERNAL_URL + 'br-microblaze-full-2018.02-891-g046c5e2.tar.bz2"\n' in configlines:

 Could we make that

    if 'BR2_PACKAGE_BOOST=y\n' in configlines and \
        'BR2_microblaze=y\n' in configlines and \
        'BR2_TOOLCHAIN_GCC_AT_LEAST_8=y\n' not in configlines

? That's more future-safe. Also I think the internal toolchain is affected as
well, no?


 Regards,
 Arnout


> +        return False
> +    # The microblaze uclibc build hangs on GCC < 8.x (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180)
> +    # http://autobuild.buildroot.net/results/424/42480ee672497a600b87e8d983e2d427befc62af/
> +    if 'BR2_PACKAGE_FLARE_ENGINE=y\n' in configlines and \
> +       BR2_TOOLCHAIN_EXTERNAL_URL + 'br-microblaze-full-2018.02-891-g046c5e2.tar.bz2"\n' in configlines:
> +        return False
> +    # The microblaze uclibc build hangs on GCC < 8.x (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180)
> +    # http://autobuild.buildroot.net/results/d20/d20700bd538ba1e9d45ab8a61ecbbba1a320ef38/
> +    if 'BR2_PACKAGE_GST_FFMPEG=y\n' in configlines and \
> +       BR2_TOOLCHAIN_EXTERNAL_URL + 'br-microblaze-full-2018.02-891-g046c5e2.tar.bz2"\n' in configlines:
> +        return False
>  
>      with open(configfile, "w+") as configf:
>          configf.writelines(configlines)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
