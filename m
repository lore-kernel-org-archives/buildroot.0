From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Nov 2016 15:51:09 +0100
Subject: [Buildroot] [PATCH] owfs: install python bindings in the
 correct location
In-Reply-To: <20161101153620.3b040c9f@free-electrons.com>
References: <20161101141448.14792-1-arnout@mind.be>
 <20161101153620.3b040c9f@free-electrons.com>
Message-ID: <990f7aa3-b4ac-5ef1-a325-155df1e821bf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-11-16 15:36, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 1 Nov 2016 15:14:48 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> +# The configure scripts finds PYSITEDIR as the python_lib directory of
>> +# host-python, and then prepends DESTDIR in front of it. So we end up
>> +# installing things in $(TARGET_DIR)/$(HOST_DIR)/usr/lib/python which is
>> +# clearly wrong.
>> +# Patching owfs to do the right thing is not trivial, it's much easier to
>> +# override the PYSITEDIR variable in make. That, in turn, is easier to do by
>> +# setting OWFS_MAKE, otherwise both OWFS_INSTALL_STAGING_OPTS and
>> +# OWFS_INSTALL_TARGET_OPTS would have to be overridden
>> +OWFS_MAKE = $(MAKE) PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> 
> Could we instead introduce a OWFS_MAKE_OPTS variable? Yes, that's a
> slightly larger change, but it's our usual pattern to handle such
> situations, so I'd prefer to have it handled like this in owfs as well.

 You mean:

OWFS_MAKE_OPTS += PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages

and then outside of the condition:

OWFS_MAKE = $(MAKE) $(OWFS_MAKE_OPTS)

?

 Regards,
 Arnout


> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
