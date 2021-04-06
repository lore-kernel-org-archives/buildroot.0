From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 6 Apr 2021 09:29:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: enable qcom-soc
 if libqrtr-glib enabled
In-Reply-To: <YGsx/vYenbBtgRtz@pevik>
References: <20210404184126.974098-1-petr.vorel@gmail.com>
 <20210405110250.1e48e10f@windsurf.home>
 <YGsULQK650v0NBsV@pevik> <20210405163630.577ec83a@windsurf.home>
 <CAAP7ucJuh-y80YWqDyvCv+uDekc2+mg-KZ+-2QT=p7x-2z+jSQ@mail.gmail.com>
 <YGsx/vYenbBtgRtz@pevik>
Message-ID: <CAAP7ucKY0U4WfD7s_w6FWA+NvO7bjWh48EswFhM969=hpfHGnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> > > > > > +ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> > > > > > +MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
>
> > > > > Isn't that missing a MODEM_MANAGER_DEPENDENCIES += libqrtr-glib line ?
> > > > > Or is it really a runtime dependency ?
> > > > Actually verified locally on buildroot, it works as is.
> > > > (no need for MODEM_MANAGER_DEPENDENCIES += libqrtr-glib).
>
> > > > Thus I've updated patchwork status to NEW.
>
> > > How can this work? Does it dlopen() the libqrtr-glib library at
> > > runtime? This deserves some explanation as we would normally imagine
> > > that to be a build-time dependency.
>
>
>
> > It's probably too soon to add libqrtr-glib as a dependency of MM, the QRTR
> > support is not even in MM git master yet (likely this week).
>
> > libqrtr-glib is right now only a dependency of libqmi, I think we should
> > focus on that. Let's add the MM build-time dependency once there is a MM
> > release with QRTR support.
>
> Thomas, sorry for confusion. Aleksander, please correct me if I'm wrong. Looking
> at ModemManager sources (8fc60754 "qcom-soc: new plugin for Qualcomm SoCs") it
> currently does not depend on libqrtr-glib at all (not sure if you want use
> libqrtr-glib dependency later only for qcom-soc for for something else in
> ModemManager).
>

Yes, that's exactly what will happen. Once the QRTR support is
integrated, it will only be used in the qcom-soc plugin. If you don't
plan to build the qcom-soc plugin, you could build ModemManager
configuring --without-qrtr and/or disabling the QRTR support also in
libqmi.

> I based decision for --enable-plugin-qcom-soc on BR2_PACKAGE_LIBQRTR_GLIB,
> because if one wants Qualcomm IPC Router protocol helper library, he probably
> wants also qcom-soc plugin. And even nobody is now using Buildroot for Qualcomm
> phones, it can change in the future.

It isn't strictly necessary though, you could use the qcom-soc plugin
without QRTR, using RPMSG instead (as it is the case right now in MM
1.16). It really depends on the SoC you're targeting to use.

-- 
Aleksander
https://aleksander.es
