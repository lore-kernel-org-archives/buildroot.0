From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2018 23:47:39 +0200
Subject: [Buildroot] [PATCH 4/6] support/testing: runtest proxy support
In-Reply-To: <20180711143113.11927-5-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-5-matthew.weber@rockwellcollins.com>
Message-ID: <ddef8aaf-7801-6189-d270-91312a4e6268@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-18 16:31, Matt Weber wrote:
> Allow builder.py to inherit the system proxy settings from
> the env if they are present.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/testing/infra/builder.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index faf1eb1494..30230fdb17 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -35,6 +35,12 @@ class Builder(object):
>  
>      def build(self):
>          env = {"PATH": os.environ["PATH"]}
> +        if "http_proxy" in os.environ:
> +            self.logfile.write("Using system proxy: " +
> +                               os.environ["http_proxy"] + "\n")
> +            self.logfile.flush()
> +            env['http_proxy'] = os.environ["http_proxy"]
> +            env['https_proxy'] = os.environ["http_proxy"]

 I'm not sure if we wouldn't want to propagate the possibly different
https_proxy variable instead, but in practice I see little use of that, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>          cmd = ["make", "-C", self.builddir]
>          ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
>                                env=env)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
