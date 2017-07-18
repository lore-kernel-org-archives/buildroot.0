From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jul 2017 21:37:53 +0200
Subject: [Buildroot] [PATCH] support/tests: allow properly indented
 config fragment
In-Reply-To: <20170715224949.25598-1-yann.morin.1998@free.fr>
References: <20170715224949.25598-1-yann.morin.1998@free.fr>
Message-ID: <420f45cf-1f44-d85f-4373-56ca3aded94a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-07-17 00:49, Yann E. MORIN wrote:
> Currently, defining a config fragment in the runtime test infra requires
> that the fragment not to be indented. This is beark, and causes grievance
> when looking at the code (e.g. to fix it).
> 
> Just strip out all leading spaces/tabs when writing the configuration
> lines into the config file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/infra/builder.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index a475bb0a30..81735dec96 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -16,7 +16,8 @@ class Builder(object):
>  
>          config_file = os.path.join(self.builddir, ".config")
>          with open(config_file, "w+") as cf:
> -            cf.write(self.config)
> +            for line in self.config.splitlines():
> +                cf.write("{}\n".format(line.lstrip()))

 I like nitpicking :-)

 I would do this in BRTest instead of down here, so that self.config contains a
correct config file. In fact, I would do it in its constructor instead of in
setUp(), so that it is done only once even if a class has two test functions.

 I would also do it as a oneliner:

	self.config = '\n'.join(map(str.lstrip, self.config.splitlines()))

but some people don't like oneliners :-)


 Regards,
 Arnout

>  
>          cmd = ["make",
>                 "O={}".format(self.builddir),
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
