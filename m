From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 10 Jul 2014 15:49:08 -0700
Subject: [Buildroot] i.MX 3.10.17 updates
In-Reply-To: <3890233.PnazMluvBb@sagittea>
References: <53BEDF43.9020401@boundarydevices.com>
 <3890233.PnazMluvBb@sagittea>
Message-ID: <53BF1864.7040204@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks J?r?me,

On 07/10/2014 02:20 PM, J?r?me Pouiller wrote:
> Hello Eric,
> 
> On Thursday 10 July 2014 11:45:23 Eric Nelson wrote:
>> Hi all,
>>
>> Thanks for all of your work on this.
>>
>> I've been able to validate the GPU portions of this, but
>> I'm struggling a bit with the VPU and gstreamer.
>>
>> Using roughly Gary's configuration, I had trouble using
>> playbin2 or gplay loading the Freescale software codecs:
>>
>> (gst-plugin-scanner:157): GStreamer-WARNING **: Failed to load plugin
>> '/usr/lib/gstreamer-0.10/libmfw_gst_mpeg4aspdec.so':
>> lib_MPEG4ASP_dec_arm11_elinux.so.1: cannot open shared object file: No
>> such file or directory
> This error is produced only during first launch, when gstreamer build its 
> plugin cache. Problem may continue to exist even if this error does not 
> appear. You have to remove ~/.gstreamer-0.10 to force cache rebuild. Can you 
> check this error does no more appear event after removing ~/.gstreamer-0.10?
> 
> If error appears, you may add this to /etc/ld.so.conf:
>  /usr/lib/imx-mm/audio-codec
>  /usr/lib/imx-mm/video-codec
>  /usr/lib/imx-mm/parser
> 
> and retry. 
> 

This is sufficient to get rid of the library loading issues, but not
sufficient to play video.

The trouble seems to be with aiurdemux (reportedly unable to link
to filesrc):

# gst-launch filesrc location=tears_of_steel_1080p.webm typefind=true !
aiurdemu
x name=demux demux. ! queue max-size-buffers=0 max-size-time=0 ! vpudec
! mfw_v4lsink demux. ! queue max-size-buffers=0 max-size-time=0 ! fakesink
(gst-launch-0.10:184): GStreamer-CRITICAL **:
gst_element_class_add_pad_template: assertion 'GST_IS_PAD_TEMPLATE
(templ)' failed
(gst-launch-0.10:184): GStreamer-CRITICAL **: gst_pad_new_from_template:
assertion 'GST_IS_PAD_TEMPLATE (templ)' failed
(gst-launch-0.10:184): GStreamer-CRITICAL **:
gst_pad_set_activate_function: assertion 'GST_IS_PAD (pad)' failed
(gst-launch-0.10:184): GStreamer-CRITICAL **:
gst_pad_set_activatepull_function: assertion 'GST_IS_PAD (pad)' failed
(gst-launch-0.10:184): GStreamer-CRITICAL **:
gst_pad_set_activatepush_function: assertion 'GST_IS_PAD (pad)' failed
(gst-launch-0.10:184): GStreamer-CRITICAL **:
gst_pad_set_chain_function: assertion 'GST_IS_PAD (pad)' failed
(gst-launch-0.10:184): GStreamer-CRITICAL **:
gst_pad_set_event_function: assertion 'GST_IS_PAD (pad)' failed
(gst-launch-0.10:184): GStreamer-CRITICAL **: gst_element_add_pad:
assertion 'GST_IS_PAD (pad)' failed
(gst-launch-0.10:184): GStreamer-CRITICAL **:
gst_pad_set_setcaps_function: assertion 'GST_IS_PAD (pad)' failed
MFW_GST_V4LSINK_PLUGIN 3.0.11 build on Jul  9 2014 19:43:54.
WARNING: erroneous pipeline: could not link filesrc0 to demux
