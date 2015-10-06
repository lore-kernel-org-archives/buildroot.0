From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2015 22:44:10 +0100
Subject: [Buildroot] [PATCH v5 3/3] gnuradio: gnuradio-python
 gnuradio-utils: add missing dependency to python-numpy
In-Reply-To: <1444126016-8815-3-git-send-email-gwenj@trabucayre.com>
References: <1444126016-8815-1-git-send-email-gwenj@trabucayre.com>
 <1444126016-8815-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <561440AA.6090706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-10-15 11:06, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Some gnuradio python blocks needs python-numpy present.
> 
> Without python-numpy, gnuradio-python based apps fails, on runtime, with traceback like:
> 
> Traceback (most recent call last):
>   File "./top_block.py", line 18, in <module>
>     from gnuradio import analog
>   File "/usr/lib/python2.7/site-packages/gnuradio/analog/__init__.py", line 35, in <module>
>     from am_demod import *
>   File "/usr/lib/python2.7/site-packages/gnuradio/analog/am_demod.py", line 22, in <module>
>     from gnuradio import gr
>   File "/usr/lib/python2.7/site-packages/gnuradio/gr/__init__.py", line 44, in <module>
>     from top_block import *
>   File "/usr/lib/python2.7/site-packages/gnuradio/gr/top_block.py", line 30, in <module>
>     from hier_block2 import hier_block2
>   File "/usr/lib/python2.7/site-packages/gnuradio/gr/hier_block2.py", line 26, in <module>
>     import pmt
>   File "/usr/lib/python2.7/site-packages/pmt/__init__.py", line 58, in <module>
>     from pmt_to_python import pmt_to_python as to_python
>   File "/usr/lib/python2.7/site-packages/pmt/pmt_to_python.py", line 22, in <module>
>     import numpy
> ImportError: No module named numpy
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 But see below

> ---
> changes v4 -> v5:
>  * Re-add BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> Changes v3 -> v4:
>  * add #runtime comment to BR2_PACKAGE_PYTHON_NUMPY select;
>  * suppress python-numpy in GNURADIO_DEPENDENCIES variable (not needed for
>    buildtime)
> Changes v2 -> v3:
>  * Since commit 826a2bc18bc0be0b08f2926c9fa1819fe909557c no special attentions
>    is needed to select python-numpy. So BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>    is no more needed
> Changes v1 -> v2:
>  * Add dependy to BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS;
>  * gnuradio-python select numpy;
>  * gnuradio-utils select again gnuradio-python;
>  * fix commit message
> ---
>  package/gnuradio/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index e264a21..f188d87 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -45,13 +45,16 @@ config BR2_PACKAGE_GNURADIO_FEC
>  
>  config BR2_PACKAGE_GNURADIO_PYTHON
>  	bool "python support"
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	select BR2_PACKAGE_BOOST_PYTHON
>  	select BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_NUMPY #runtime

 We usually put a space between # runtime

 Regards,
 Arnout

>  	help
>  	  Enable python component
>  
>  config BR2_PACKAGE_GNURADIO_UTILS
>  	bool "gr-utils support"
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	select BR2_PACKAGE_GNURADIO_PYTHON
>  	help
>  	  Misc python utilities
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
